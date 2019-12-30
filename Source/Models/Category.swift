
import UIKit

enum Category: Int, CaseIterable, IconTitleCellDisplayModelType {
    
    case health = 0
    case fitness
    case home
    case social
    
    var title: String {
        switch self {
        case .health: return "Health"
        case .fitness: return "Fitness"
        case .home: return "Home"
        case .social: return "Social"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .health: return UIImage(named: Icon.pharmacy)!
        case .fitness: return UIImage(named: Icon.dumbell)!
        case .home: return UIImage(named: Icon.washingMachine)!
        case .social: return UIImage(named: Icon.womanMan)!
        }
    }
    
    var habits: [Habit] {
        switch self {
        case .health: return [.meal, .fruit, .water, .takeBreak, .vitamins]
        case .fitness: return [.water, .medication]
        case .home: return [.takeBreak]
        case .social: return [.takeBreak]
        }
    }
}
