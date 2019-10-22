
import UIKit

class SuggestedHabitViewController: UIViewController {

  private var viewModel: SuggestedHabitViewModel!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(with viewModel: SuggestedHabitViewModel) {
    super.init(nibName: nil, bundle: nil)
    self.viewModel = viewModel
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel.navBarTitle
  }
}
