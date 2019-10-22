
import UIKit

final class SuggestedCategoryViewController: UIViewController {
  @IBOutlet private var tableView: UITableView!
  
  private var viewModel: SuggestedCategoryViewModel!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(with viewModel: SuggestedCategoryViewModel) {
    super.init(nibName: nil, bundle: nil)
    self.viewModel = viewModel
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel.navBarTitle
    tableView.register(cellType: CommonCell.self)
  }
}

extension SuggestedCategoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsIn(section)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(cellType: CommonCell.self, for: indexPath)
    cell.configure()
    return cell
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return viewModel.titleForHeaderIn(section)
  }
}

extension SuggestedCategoryViewController: UITableViewDelegate {
  
}
