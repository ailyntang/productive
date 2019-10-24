
import UIKit

class SuggestedHabitViewController: UIViewController {

  private var viewModel: BaseSuggestedViewModel!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(with viewModel: BaseSuggestedViewModel, category: Category) {
    super.init(nibName: nil, bundle: nil)
    self.viewModel = viewModel
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel.navBarTitle
  }
}
