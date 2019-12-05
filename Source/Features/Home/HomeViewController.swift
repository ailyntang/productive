
import UIKit

final class HomeViewController: UIViewController {
  
    
  let viewModel = HomeViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel.navBarTitle
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: viewModel.rightBarButtonTitle, style: .plain, target: self, action: #selector(addTapped))
  }
  
  @objc func addTapped() {
    let viewModel = BaseSuggestedViewModel(habit: Habit(), habitStage: HabitStage.addCategory)
    let viewController = BaseSuggestedViewController(with: viewModel)
    viewController.delegate = self
    navigationController?.pushViewController(viewController, animated: true)
  }
}

extension HomeViewController: AddNewHabitDelegate {
  func addNewHabit(_ addNewHabit: UIViewController, habit: Habit) {
    title = habit.action?.title ?? habit.category?.title
  }
}
