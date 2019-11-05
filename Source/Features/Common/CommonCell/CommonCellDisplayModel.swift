
import UIKit

struct CommonCellDisplayModel: CommonCellDisplayModelType {
  var icon: UIImage?
  var title: String?
  
  init(icon: UIImage?, title: String?) {
    self.icon = icon
    self.title = title
  }
}
