
import UIKit

final class BaseSuggestedViewController: UIViewController {
  @IBOutlet private var tableView: UITableView!
  
  private var viewModel: BaseSuggestedViewModel!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(with viewModel: BaseSuggestedViewModel) {
    super.init(nibName: nil, bundle: nil)
    self.viewModel = viewModel
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(cellType: CommonCell.self)
  }
}

extension BaseSuggestedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsIn(section)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(cellType: CommonCell.self, for: indexPath)
    cell.configure(with: viewModel.cellViewModel(for: indexPath))
    return cell
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return viewModel.titleForHeaderIn(section)
  }
}

extension BaseSuggestedViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
