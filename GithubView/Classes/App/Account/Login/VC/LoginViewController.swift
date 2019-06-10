import GithubPresentation
import UIKit

final class LoginViewController: UIViewController {
  private let presenter = LoginPresenter()

  init() {
    super.init(nibName: nil, bundle: Bundle(for: LoginViewController.self))
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.view = self
  }
}

// MARK: ユーザーアクション

private extension LoginViewController {
  @IBAction func didTapLoginBtn() {
    GithubOAuth.shared.delegate = self
    GithubOAuth.shared.authorize()
  }
}

// MARK: GithubOAuthDelegate

extension LoginViewController: GithubOAuthDelegate {
  func succeededGithubOAuth(_ oauth: GithubOAuth, accessToken: String) {
    GithubOAuth.shared.delegate = nil
    presenter.singIn(accessToken: accessToken)
  }

  func failedGithubOAuth(_ oauth: GithubOAuth, error: Error) {
    GithubOAuth.shared.delegate = nil
  }
}

// MARK: LoginPresenterView

extension LoginViewController: LoginPresenterView {
  func succeededSignIn() {
    log.i("succeededSignIn")
  }
}
