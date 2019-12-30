
import UIKit
import CoreData

var habits: [NSManagedObject] = []

struct CoreDataManager {
    
    func save(_ habit: Habit) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MyHabit", in: managedContext)!
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
}
