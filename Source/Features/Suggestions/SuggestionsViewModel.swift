
import UIKit

struct SuggestionsViewModel {
    let numberOfSections = 2
    let title: String = Text.mainTitle
    let addNewHabitCell: IconTitleCellDisplayModelType = {
        let cell = IconTitleCellDisplayModel(icon: UIImage(named: "iconPencil")!, title: Text.addNewHabitTitle)
        return cell
    }()
    
    let cells: [IconTitleCellDisplayModelType]
    
    init(with cells: [IconTitleCellDisplayModelType]) {
        self.cells = cells
    }

    func numberOfRowsIn(_ section: Int) -> Int {
        return section == 0 ? 1 : cells.count
    }
    
    func titleForHeaderIn(_ section: Int) -> String? {
        return section == 0 ? nil : Text.sectionTitle
    }
}

private enum Text {
    static let mainTitle = "Add new habit"
    static let sectionTitle = "Or choose from one of these options"
    static let addNewHabitTitle = "Write your own"
}
