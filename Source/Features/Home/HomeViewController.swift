
import UIKit

final class ViewController: UIViewController {

  let viewModel = HomeViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel.navBarTitle
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: viewModel.rightBarButtonTitle, style: .plain, target: self, action: #selector(addTapped))
  }

  @objc func addTapped() {
    navigationController?.pushViewController(SuggestedCategoryViewController.init(with: SuggestedCategoryViewModel()), animated: true)
  }
}
