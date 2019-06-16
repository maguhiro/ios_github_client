import UIKit

class SearchRepositoryViewController: UIViewController {
  private let searchBar = UISearchBar()

  init() {
    super.init(nibName: nil, bundle: Bundle(for: SearchRepositoryViewController.self))
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.titleView = searchBar
  }
}
