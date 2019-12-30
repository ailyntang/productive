
import UIKit
import CoreData

// TODO: is there a way to stop this from being a global variable?
var habits: [NSManagedObject] = []

struct CoreDataManager {
    
    func save(_ habit: Habit) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Text.entityName, in: managedContext)!
        let habitDatabase = NSManagedObject(entity: entity, insertInto: managedContext)
        
        habitDatabase.setValue(habit.title, forKeyPath: "title")
        habitDatabase.setValue(habit.icon.pngData(), forKeyPath: "icon")
        
        do {
            try managedContext.save()
            habits.append(habitDatabase)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchHabits() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Text.entityName)
        
        do {
            habits = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}

private enum Text {
    static let entityName = "MyHabit"
}
