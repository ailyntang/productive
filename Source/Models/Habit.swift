
import UIKit

protocol AddNewHabitDelegate: class {
  func addNewHabit(_ addNewHabit: UIViewController, habit: Habit)
}

struct Habit {
  let category: Category?
  let action: Action?
  
  init(category: Category? = nil, action: Action? = nil) {
    self.category = category
    self.action = action
  }
}

enum HabitStage {
  case addCategory
  case addAction
}