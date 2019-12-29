
import UIKit

final class SuggestionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.register(cellType: IconTitleCell.self)
        }
    }
    
    private var viewModel: SuggestionsViewModel!
    
    weak var delegate: AddNewHabitDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(with viewModel: SuggestionsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
    }
    
    // MARK: - Conformance UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsIn(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellType: IconTitleCell.self, for: indexPath)
        let cellFromViewModel = indexPath.section == 0 ? viewModel.addNewHabitCell : viewModel.cells[indexPath.row]
        cell.configure(with: cellFromViewModel)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeaderIn(section)
    }
    
    // MARK: - Conformance UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            navigationController?.pushViewController(CreateHabitViewController(with: CreateHabitViewModel()), animated: true)
            
        } else if viewModel.suggestion == .forCategories {
            let category = viewModel.cells[indexPath.row] as! Category
            let habits: [Habit] = category.habits
            let viewModel = SuggestionsViewModel(with: habits, .forHabits)
            let viewController = SuggestionsViewController(with: viewModel)
            viewController.delegate = self
            navigationController?.pushViewController(viewController, animated: true)
            
        } else {
            let habit = viewModel.cells[indexPath.row] as! Habit
            delegate?.addNewHabit(habit)
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

extension SuggestionsViewController: AddNewHabitDelegate {
    func addNewHabit(_ habit: Habit) {
        // TODO: add new habit to the database, need to figure out how to implement a database
    }
}
