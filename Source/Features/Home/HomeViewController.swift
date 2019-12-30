
import UIKit
import CoreData

final class HomeViewController: UIViewController {

    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.register(cellType: IconTitleCell.self)
        }
    }
    
    var habits: [NSManagedObject] = []
    
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.navBarTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: viewModel.rightBarButtonTitle, style: .plain, target: self, action: #selector(addTapped))
        
//        if viewModel.habits.count == 0 {
//            setupNoHabitsView()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "HabitDatabase")
        
        do {
          habits = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
        
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

private extension HomeViewController {
    func setupNoHabitsView() {
        self.view.backgroundColor = .white
        let screenWidth = view.bounds.size.width
        let screenHeight = view.bounds.size.height
        let bgImage = UIImageView(image: UIImage(named: "wallpaper"))
        
        // Scale background image to fit all screen sizes
        bgImage.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        bgImage.transform = CGAffineTransform(scaleX: screenWidth / 414, y: screenHeight / 736)
        view.addSubview(bgImage)
        
        let addHabitLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        addHabitLabel.text = "Add a habit\nto get started"
        addHabitLabel.numberOfLines = 2
        addHabitLabel.textAlignment = .center
        addHabitLabel.font = UIFont(name: "Baskerville-Bold", size: 28)
        view.addSubview(addHabitLabel)
    }
}
