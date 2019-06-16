import UIKit

class MyPageViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  init() {
    super.init(nibName: nil, bundle: Bundle(for: MyPageViewController.self))
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
