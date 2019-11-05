
import UIKit

enum Action: CaseIterable {
  case meal
  case water
  case fruit

  var title: String {
    switch self {
    case .meal: return "Meal"
    case .water: return "Water"
    case .fruit: return "Fruit"
    }
  }

  var icon: UIImage? { return nil }
}
