
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
    tableView.register(cellType: CommonCell.self)
  }
}

extension SuggestedCategoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(cellType: CommonCell.self, for: indexPath)
    cell.configure()
    return cell
  }
}

extension SuggestedCategoryViewController: UITableViewDelegate {
  
}
