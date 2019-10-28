
import UIKit

enum Category: Int, CaseIterable {
  case health = 0
  case fitness
  
  var title: String {
    switch self {
    case .health: return "Health"
    case .fitness: return "Fitness"
    }
  }
  
  var icon: UIImage? {
    switch self {
    case .health: return nil
    case .fitness: return nil
    }
  }
  var actions: [Action] {
    switch self {
    case .health: return []
    case .fitness: return []
    }
  }
}

enum Action: CaseIterable {
  case meal
  case water
  case fruit
  
  var title: String { return "FRUIT YO" }
  var icon: UIImage? { return nil }
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
