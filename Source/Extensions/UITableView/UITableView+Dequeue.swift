
import UIKit

protocol Dequeuable {
  static var dequeueIdentifier: String {get}
}

extension UITableView {
  func register<Cell: Dequeuable>(cellType: Cell.Type) {
    register(UINib.init(nibName: Cell.dequeueIdentifier, bundle: nil), forCellReuseIdentifier: Cell.dequeueIdentifier)
  }

  func dequeue<Cell: Dequeuable>(cellType: Cell.Type, for indexPath: IndexPath) -> Cell {
    guard let cell = dequeueReusableCell(withIdentifier: Cell.dequeueIdentifier, for: indexPath) as? Cell else {
      fatalError("Failed to dequeue cell with identifier \(Cell.dequeueIdentifier). Did you forget to register it?")
    }
    return cell
  }
}
