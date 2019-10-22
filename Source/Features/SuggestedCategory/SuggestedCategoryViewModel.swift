
import Foundation

struct SuggestedCategoryViewModel {
  let navBarTitle = "Suggested Categories"
  let numberOfSections = 2
  
  func numberOfRowsIn(_ section: Int) -> Int {
    return section == 0 ? 1 : 5
  }
  
  func titleForHeaderIn(_ section: Int) -> String? {
    return section == 0 ? nil : "Or choose from these topics"
  }
}
