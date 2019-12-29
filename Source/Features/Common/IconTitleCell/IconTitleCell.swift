
import UIKit

final class IconTitleCell: UITableViewCell {
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var iconImageView: UIImageView!
  
  func configure(with displayModel: IconTitleCellDisplayModelType) {
    titleLabel?.text = displayModel.title
    iconImageView.image = displayModel.icon
  }
}

extension IconTitleCell: Dequeuable {
  static var dequeueIdentifier: String = "IconTitleCell"
}
