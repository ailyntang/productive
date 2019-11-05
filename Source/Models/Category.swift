
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
