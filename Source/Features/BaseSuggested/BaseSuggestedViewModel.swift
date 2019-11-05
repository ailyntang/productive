
import UIKit

struct BaseSuggestedViewModel {
  let numberOfSections = 2
  
  private let habit: Habit
  private let habitStage: HabitStage
  
  init(habit: Habit, habitStage: HabitStage) {
    self.habit = habit
    self.habitStage = habitStage
  }

  func numberOfRowsIn(_ section: Int) -> Int {
    // Section 0 has one row: "Write my own"
    if section == 0 {
      return 1
    } else {
      // Section 1 has prefilled options
      switch habitStage {
      case .addCategory: return Category.allCases.count
      case .addAction: return habit.category?.actions.count ?? 0
      }
    }
  }

  func titleForHeaderIn(_ section: Int) -> String? {
    // Section 0 has no title
    if section == 0 {
      return nil
    } else {
      switch habitStage {
      case .addCategory: return "Or choose from these categories"
      case .addAction: return "Or choose from these actions"
      }
    }
  }

  func cellViewModel(for indexPath: IndexPath) -> CommonCellDisplayModelType {
    // Section 0 always returns the same cell
    if indexPath.section == 0 {
      return CommonCellDisplayModel(icon: UIImage(named: "iconPencil"), title: "Write my own")
    }

    // Section 1 cells are based on the Category and Action models
    let newHabit = habit(for: indexPath)
    var icon: UIImage?
    var title: String?

    switch habitStage {
    case .addCategory:
      icon = newHabit.category?.icon
      title = newHabit.category?.title
    case .addAction:
      icon = newHabit.action?.icon
      title = newHabit.action?.title
    }

    return CommonCellDisplayModel(icon: icon, title: title)
  }

  func habit(for indexPath: IndexPath) -> Habit {
    switch habitStage {
    case .addCategory:
      let category = Category(rawValue: indexPath.row)
      return Habit(category: category, action: nil)
    case .addAction:
      let category = habit.category
      let action = category?.actions[indexPath.row]
      return Habit(category: category, action: action)
    }
  }
}
