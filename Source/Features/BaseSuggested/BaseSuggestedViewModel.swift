
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
