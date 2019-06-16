import Nuke
import UIKit

extension UIImageView {
  func setImage(url: URL, placeholder: UIImage? = nil) {
    let options = ImageLoadingOptions(placeholder: placeholder, transition: .fadeIn(duration: 0.3))
    Nuke.loadImage(with: url, options: options, into: self)
  }
}
