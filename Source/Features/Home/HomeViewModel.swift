
import Foundation
import CoreData

struct HomeViewModel {
    let navBarTitle = "Home"
    let rightBarButtonTitle = "Add"
    let categories: [Category] = [.fitness, .health]
    var habits: [NSManagedObject] = []  // TODO: need to read this from a database
}
