
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
    let row = indexPath.row
    switch content {
    case "category": cell = Category(rawValue: row) as! Category
    case "health": cell = HealthHabit(rawValue: row) as! HealthHabit
    default: cell = HealthHabit(rawValue: row) as! HealthHabit
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

/* Questions for Simon
   Right now I'm passing in a string to my view model.
   Ideally I'd like to pass in the enum, e.g. HealthHabit, Category or FitnessHabit
   I can't figure out how to pass in the entire enum, rather than just one case of the enum
 
   My other thought was to use a generic function to help with this. At the very least, to
   refactor `rowDisplayModel`. But I can't get that to work.
 */

// How can I get this to work?
//  private func createCell<Cell: CommonCellDisplayModelType>(with cellType: Cell.Type) -> CommonCellDisplayModelType {
//    return Cell(rawValue: 3) as! Cell
//  }
