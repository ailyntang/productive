
import UIKit

struct BaseSuggestedViewModel {
  let navBarTitle: String
  let numberOfSections = 2
  
  private let content: String
  
  init(content: String) {
    self.content = content
    navBarTitle = content == "category" ? "Suggested Category" : "Suggested Habit"
  }

  func numberOfRowsIn(_ section: Int) -> Int {
    return section == 0 ? 1 : Category.allCases.count
  }
  
  func titleForHeaderIn(_ section: Int) -> String? {
    return section == 0 ? nil : "Or choose from these topics"
  }
  
  func rowDisplayModel(for indexPath: IndexPath) -> CommonCellDisplayModelType {
    if indexPath.section == 0 {
      return CommonCellDisplayModel(icon: UIImage(named: "iconPencil"), title: "Write my own")
    }
    
    var cell: CommonCellDisplayModelType
    if content == "category" {
      cell = Category(rawValue: indexPath.row) as! Category
    } else {
      cell = HealthHabit(rawValue: indexPath.row) as! HealthHabit
    }
    return CommonCellDisplayModel(icon: cell.icon, title: cell.title)
  }

  func viewControllerForRowAt(_ indexPath: IndexPath) -> UIViewController {
    if indexPath.section == 0 {
      return ChooseNameAndIconViewController(with: ChooseNameAndIconViewModel())
    }
    
    let habit = Category(rawValue: indexPath.row)?.title
    return BaseSuggestedViewController(with: BaseSuggestedViewModel(content: habit ?? ""))
  }
}

