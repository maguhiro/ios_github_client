import UIKit

final class LoginViewController: UIViewController {
  init() {
    super.init(nibName: nil, bundle: Bundle(for: LoginViewController.self))
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

// MARK: ユーザーアクション

private extension LoginViewController {
  @IBAction func didTapLoginBtn() {
    GithubOAuth.shared.authorize()
  }
}
