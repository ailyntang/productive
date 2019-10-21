
import UIKit

final class CommonViewController: UIViewController {
  @IBOutlet private var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(cellType: CommonCell.self)
  }
}

extension CommonViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(cellType: CommonCell.self, for: indexPath)
    cell.configure()
    return cell
  }
}
