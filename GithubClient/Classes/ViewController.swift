import GithubView
import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func didTapAuthorizationButton() {
    GithubOAuth.shared.authorize()
  }
}
