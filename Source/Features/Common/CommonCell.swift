
import UIKit

final class CommonCell: UITableViewCell {
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var iconImageView: UIImageView!
  
  func configure() {
    titleLabel?.text = "YOOOO"
  }
}

extension CommonCell: Dequeuable {
  static var dequeueIdentifier: String = "CommonCell"
}
