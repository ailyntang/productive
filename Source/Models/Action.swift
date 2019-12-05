
import UIKit

enum Action: CaseIterable {
  case meal
  case water
  case fruit

  var title: String {
    switch self {
    case .meal: return "Eat a good meal"
    case .water: return "Drink some water"
    case .fruit: return "Eat some fruit"
    }
  }

  var icon: UIImage? {
    switch self {
    case .meal: return #imageLiteral(resourceName: "iconWashingMachine")
    case .water: return #imageLiteral(resourceName: "iconClock")
    case .fruit: return #imageLiteral(resourceName: "iconWomanMan")
    }
  }
}
