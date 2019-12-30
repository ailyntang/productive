
import UIKit

struct SuggestionsViewModel {
    let numberOfSections = 2
    let title: String
    let addNewHabitCell: IconTitleCellDisplayModelType = {
        let cell = IconTitleCellDisplayModel(icon: UIImage(named: "iconPencil")!, title: Text.addNewHabitTitle)
        return cell
    }()
    
    let cells: [IconTitleCellDisplayModelType]
    let suggestion: Suggestion
    
    init(with cells: [IconTitleCellDisplayModelType], _  suggestion: Suggestion) {
        self.cells = cells
        self.suggestion = suggestion
        title = suggestion == .forCategories ? Text.navTitleForCategories : Text.navTitleForHabits
    }

    func numberOfRowsIn(_ section: Int) -> Int {
        return section == 0 ? 1 : cells.count
    }
    
    func titleForHeaderIn(_ section: Int) -> String? {
        return section == 0 ? nil : Text.sectionTitle
    }
}

private enum Text {
    static let navTitleForCategories = "Choose a category"
    static let navTitleForHabits = "Choose a habit"
    static let sectionTitle = "Or choose from one of these options"
    static let addNewHabitTitle = "Write your own"
}
