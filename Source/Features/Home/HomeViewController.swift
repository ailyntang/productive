
import UIKit

final class HomeViewController: UIViewController {

    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.navBarTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: viewModel.rightBarButtonTitle, style: .plain, target: self, action: #selector(addTapped))
        
        if viewModel.habits.count == 0 {
            setupNoHabitsView()
        }
    }
    
    @objc func addTapped() {
        let categories: [Category] = [.fitness, .health]
        let viewModel = SuggestionsViewModel(with: categories, .forCategories)
        let viewController = SuggestionsViewController(with: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
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
