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
    initializeTabBarViewControllers()
  }
}

private extension TopViewController {
  func initializeTabBarViewControllers() {
    let searchVC = SearchRepositoryViewController()
    let naviVC = UINavigationController(rootViewController: searchVC)
    naviVC.tabBarItem = searchTabItem

    let accountVC = AccountContainerViewController()
    accountVC.tabBarItem = accountTabItem
    setViewControllers([naviVC, accountVC], animated: false)
  }
}
