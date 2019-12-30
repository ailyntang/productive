
import UIKit
import CoreData

struct HomeViewModel {
    let navBarTitle = "Home"
    let rightBarButtonTitle = "Add"
    let categories: [Category] = [.fitness, .health]
    
    var habits: [NSManagedObject] = []  // TODO: need to read this from a database
    
    
//    func fetchHabitsFromDatabase() {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "HabitDatabase")
//
//        do {
//            self.habits = try managedContext.fetch(fetchRequest)
//        } catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//    }
    
}
