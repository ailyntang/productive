
import UIKit

struct BaseSuggestedViewModel {
  let numberOfSections = 2
  
  private let habit: Habit
  let habitStage: HabitStage
  
  init(habit: Habit, habitStage: HabitStage) {
    self.habit = habit
    self.habitStage = habitStage
  }

  func numberOfRowsIn(_ section: Int) -> Int {
    switch habitStage {
    case .addCategory: return Category.allCases.count
    case .addAction: return habit.category?.actions.count ?? 0
    }
  }
  
  func titleForHeaderIn(_ section: Int) -> String? {
    guard section == 0 else { return nil }
    
    switch habitStage {
    case .addCategory: return "Or choose from these categories"
    case .addAction: return "Or choose from these actions"
    }
  }
  
  func cellViewModel(for indexPath: IndexPath) -> CommonCellDisplayModelType {
    switch habitStage {
    case .addCategory:
      let category = Category(rawValue: indexPath.row)
      return CommonCellDisplayModel(icon: category?.icon, title: category?.title)
    case .addAction:
      let category = habit.category
      let action = category?.actions[indexPath.row]
      return CommonCellDisplayModel(icon: action?.icon, title: action?.title)
    }
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
