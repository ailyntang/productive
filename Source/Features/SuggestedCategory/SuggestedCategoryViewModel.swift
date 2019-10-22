
import UIKit

struct SuggestedCategoryViewModel {
  let navBarTitle = "Suggested Categories"
  let numberOfSections = 2
  
  func numberOfRowsIn(_ section: Int) -> Int {
    return section == 0 ? 1 : 6
  }
  
  func titleForHeaderIn(_ section: Int) -> String? {
    return section == 0 ? nil : "Or choose from these topics"
  }
  
  func rowDisplayModel(for indexPath: IndexPath) -> CommonCellDisplayModelType {
    if indexPath.section == 0 {
      return CommonCellDisplayModel(icon: Category.custom.icon!, title: Category.custom.title)
    }
    
    switch indexPath.row {
    case 0: return CommonCellDisplayModel(icon: Category.health.icon!, title: Category.health.title)
    case 1: return CommonCellDisplayModel(icon: Category.fitness.icon!, title: Category.fitness.title)
    case 2: return CommonCellDisplayModel(icon: Category.home.icon!, title: Category.home.title)
    case 3: return CommonCellDisplayModel(icon: Category.hobbies.icon!, title: Category.hobbies.title)
    case 4: return CommonCellDisplayModel(icon: Category.social.icon!, title: Category.social.title)
    case 5: return CommonCellDisplayModel(icon: Category.efficiency.icon!, title: Category.efficiency.title)
    default: return CommonCellDisplayModel(icon: Category.hobbies.icon!, title: Category.health.title)
    }
  }
}
