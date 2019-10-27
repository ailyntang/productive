
import UIKit

enum Category2: Int, CaseIterable {
  case health = 0
  case fitness
  case home
  case hobbies
  case social
  case efficiency
  
  var title: String {
    switch self {
    case .health: return "Health"
    case .fitness: return "Fitness"
    case .home: return "Home"
    case .hobbies: return "Hobbies"
    case .social: return "Social"
    case .efficiency: return "Efficiency"
    }
  }
  
  var icon: UIImage? {
    switch self {
    case .health: return #imageLiteral(resourceName: "iconPharmacy")
    case .fitness: return #imageLiteral(resourceName: "iconDumbbell")
    case .home: return #imageLiteral(resourceName: "iconWashingMachine")
    case .hobbies: return #imageLiteral(resourceName: "iconStar")
    case .social: return #imageLiteral(resourceName: "iconWomanMan")
    case .efficiency: return #imageLiteral(resourceName: "iconClock")
    }
  }
}

enum HealthHabit: Int {
  case eatMeal = 0
  case eatFruit
  case drinkWater
  case brushFloss
  case takeMedication
  case takeVitamins
  case takeBreak
  
  var title: String {
    switch self {
    case .eatMeal: return "Eat a good meal"
    case .eatFruit: return "Eat some fruit"
    case .drinkWater: return "Drink some water"
    case .brushFloss: return "Brush & floss"
    case .takeMedication: return "Take medication"
    case .takeVitamins: return "Take vitamins"
    case .takeBreak: return "Take a break"
    }
  }
  
  var icon: UIImage? {
    switch self {
    case .eatMeal: return #imageLiteral(resourceName: "iconClock")
    case .eatFruit: return #imageLiteral(resourceName: "iconClock")
    case .drinkWater: return #imageLiteral(resourceName: "iconClock")
    case .brushFloss: return #imageLiteral(resourceName: "iconClock")
    case .takeMedication: return #imageLiteral(resourceName: "iconClock")
    case .takeVitamins: return #imageLiteral(resourceName: "iconClock")
    case .takeBreak: return #imageLiteral(resourceName: "iconClock")
    }
  }
}

// With Simon

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
  
  var title: String { return "" }
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
