
import UIKit

enum Habit: CaseIterable, IconTitleCellDisplayModelType {
    case meal
    case water
    case fruit
    case brush
    case medication
    case vitamins
    case takeBreak
    
    var title: String {
        switch self {
        case .meal: return "Eat a good meal"
        case .water: return "Drink some water"
        case .fruit: return "Eat some fruit"
        case .brush: return "Brush & floss"
        case .medication: return "Take medication"
        case .vitamins: return "Take vitamins"
        case .takeBreak: return "Take a break"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .meal: return UIImage(named: Icon.plate)!
        case .water: return UIImage(named: Icon.waterDrop)!
        case .fruit: return UIImage(named: Icon.apple)!
        case .brush: return UIImage(named: Icon.tooth)!
        case .medication: return UIImage(named: Icon.pharmacy)!
        case .vitamins: return UIImage(named: Icon.pill)!
        case .takeBreak: return UIImage(named: Icon.clock)!
        }
    }
}
