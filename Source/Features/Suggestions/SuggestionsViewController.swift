
import UIKit

final class SuggestionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet private var tableView: UITableView! {
    didSet {
      tableView.register(cellType: IconTitleCell.self)
    }
  }
  
  private var viewModel: SuggestionsViewModel!
  
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
    cell.configure(with: viewModel.cells[indexPath.row])
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
    
//    let habit = viewModel.habit(for: indexPath)
//
//    if let _ = habit.action {
//        delegate?.addNewHabit(self, habit: habit)
//    }
    
    if indexPath.section == 0 {
      navigationController?.pushViewController(CreateHabitViewController(with: CreateHabitViewModel()), animated: true)
    
        // TODO: will need to change the else if away from the title
    } else if title == "Categories" {
        let habits: [Habit] = Category.fitness.habits
        let viewModel = SuggestionsViewModel(with: habits)
      let viewController = SuggestionsViewController(with: viewModel)
      navigationController?.pushViewController(viewController, animated: true)
    } else {
      navigationController?.popToRootViewController(animated: true)
    }
  }
}