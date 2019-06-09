import UIKit

public final class TopViewController: UITabBarController {
  private let searchTabItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
  private let accountTabItem = UITabBarItem(title: "Account", image: Asset.account.image, tag: 1)

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    // FIXME: 正しいVCを設定する
    let searchVC = LoginViewController()
    searchVC.tabBarItem = searchTabItem
    let accountVC = LoginViewController()
    accountVC.tabBarItem = accountTabItem
    setViewControllers([searchVC, accountVC], animated: false)
  }
}
