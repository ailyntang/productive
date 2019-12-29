
import Foundation

struct HomeViewModel {
    let navBarTitle = "Home"
    let rightBarButtonTitle = "Add"
    let categories: [Category] = [.fitness, .health]
    var habits: [Habit] = []
}
