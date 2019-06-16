import GithubPresentation
import UIKit

final class AccountContainerViewController: UIViewController {
  private let presenter = AccountContainerPresenter()
  private let loginVC = LoginViewController()
  private let myPageVC = MyPageViewController()

  @IBOutlet private var containerView: UIView!

  init() {
    super.init(nibName: nil, bundle: Bundle(for: AccountContainerViewController.self))
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private var contentViewController: UIViewController? {
    didSet {
      if let oldValue = oldValue, oldValue.isEqual(contentViewController) {
        return
      }

      oldValue?.willMove(toParent: nil)
      oldValue?.view.removeFromSuperview()
      oldValue?.removeFromParent()

      guard let contentViewController = contentViewController else {
        return
      }
      addChild(contentViewController)
      contentViewController.didMove(toParent: self)
      contentViewController.view.frame = containerView.bounds
      containerView.addSubview(contentViewController.view)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.view = self
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.showPage()
  }
}

extension AccountContainerViewController: AccountContainerView {
  func changeSigninStatus(isLogin: Bool) {
    if isLogin {
      contentViewController = myPageVC
    } else {
      contentViewController = loginVC
    }
  }
}
