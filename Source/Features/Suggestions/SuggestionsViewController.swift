
import UIKit

final class SuggestionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet private var tableView: UITableView! {
    didSet {
      tableView.register(cellType: IconTitleCell.self)
    }
  }
  
  private var viewModel: SuggestionsViewModel!
  
  // Can't figure out how to make this private
  weak var delegate: AddNewHabitDelegate?

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(with viewModel: SuggestionsViewModel) {
    super.init(nibName: nil, bundle: nil)
    self.viewModel = viewModel
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel.title
  }

  // MARK: - Conformance UITableViewDataSource

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsIn(section)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(cellType: IconTitleCell.self, for: indexPath)
    cell.configure(with: viewModel.cellViewModel(for: indexPath))
    return cell
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return viewModel.titleForHeaderIn(section)
  }

  // MARK: - Conformance UITableViewDelegate

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    delegate?.addNewHabit(self, habit: viewModel.habit(for: indexPath))

    if indexPath.section == 0 {
      navigationController?.pushViewController(CreateHabitViewController(with: CreateHabitViewModel()), animated: true)
    } else if title == "Categories" {
      let newViewModel = SuggestionsViewModel(habit: viewModel.habit(for: indexPath), habitStage: .addAction)
      let viewController = SuggestionsViewController(with: newViewModel)
      navigationController?.pushViewController(viewController, animated: true)
    } else {
      navigationController?.popToRootViewController(animated: true)
    }
  }
}
