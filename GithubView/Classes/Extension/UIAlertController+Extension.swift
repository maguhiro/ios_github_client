import UIKit

extension UIAlertController {
  static func makeOKAlert(title: String?,
                          message: String? = nil,
                          handler: (() -> Void)? = nil) -> UIAlertController {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
      handler?()
    }
    alert.addAction(okAction)

    return alert
  }
}
