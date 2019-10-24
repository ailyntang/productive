
import UIKit

enum Category: Int, CaseIterable, CommonCellDisplayModelType {
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

enum HealthHabit: Int, CommonCellDisplayModelType {
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
