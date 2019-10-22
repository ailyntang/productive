
import UIKit

enum Category: CaseIterable {
  case health
  case fitness
  case home
  case hobbies
  case social
  case efficiency
  case custom
  
  var title: String {
    switch self {
    case .health: return "Health"
    case .fitness: return "Fitness"
    case .home: return "Home"
    case .hobbies: return "Hobbies"
    case .social: return "Social"
    case .efficiency: return "Efficiency"
    case .custom: return "Write my own"
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
    case .custom: return #imageLiteral(resourceName: "iconPencil")
    }
  }
}
