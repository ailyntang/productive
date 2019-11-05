
import UIKit

final class CommonCell: UITableViewCell {
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var iconImageView: UIImageView!
  
  func configure(with displayModel: CommonCellDisplayModelType) {
    titleLabel?.text = displayModel.title
    iconImageView.image = displayModel.icon
  }
}

extension CommonCell: Dequeuable {
  static var dequeueIdentifier: String = "CommonCell"
}
