
import UIKit
import CoreData

final class HomeViewController: UIViewController {

    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.register(cellType: IconTitleCell.self)
            tableView.rowHeight = 56.0
        }
    }
    
    private var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.navBarTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: viewModel.rightBarButtonTitle, style: .plain, target: self, action: #selector(addTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CoreDataManager().fetchHabits()
        tableView.reloadData()
    }
    
    @objc func addTapped() {
        let categories: [Category] = [.fitness, .health]
        let viewModel = SuggestionsViewModel(with: categories, .forCategories)
        let viewController = SuggestionsViewController(with: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellType: IconTitleCell.self, for: indexPath)
        let habit = habits[indexPath.row]
        let title = habit.value(forKeyPath: "title") as? String
        let icon = UIImage(data: habit.value(forKeyPath: "icon") as! Data)
        
        cell.configure(with: IconTitleCellDisplayModel(icon: icon ?? UIImage(named: "iconPencil")!, title: title ?? ""))
        return cell
    }
}
