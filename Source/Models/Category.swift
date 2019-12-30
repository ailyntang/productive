
import UIKit

enum Category: Int, CaseIterable, IconTitleCellDisplayModelType {
    
  case health = 0
  case fitness

  var title: String {
    switch self {
    case .health: return "Health"
    case .fitness: return "Fitness"
    }
  }

  var icon: UIImage {
    switch self {
    case .health: return #imageLiteral(resourceName: "iconPharmacy")
    case .fitness: return #imageLiteral(resourceName: "iconDumbbell")
    }
  }

  var habits: [Habit] {
    switch self {
    case .health: return [.meal, .fruit, .water]
    case .fitness: return [.water]
    }
  }
}
