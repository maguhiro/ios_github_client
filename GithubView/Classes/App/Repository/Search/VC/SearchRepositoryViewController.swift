import GithubPresentation
import RxCocoa
import RxSwift
import UIKit

final class SearchRepositoryViewController: UIViewController {
  private let disposeBag = DisposeBag()
  private let presenter = SearchRepositoryPresenter()
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
    initalizeView()
  }
}

private extension SearchRepositoryViewController {
  func initalizeView() {
    navigationItem.titleView = searchBar
    searchBar.rx.text.orEmpty
      .distinctUntilChanged()
      .debounce(.milliseconds(200), scheduler: MainScheduler.instance)
      .subscribe(onNext: { [weak self] text in
        log.i(text)
        self?.presenter.search(query: text)
      })
      .disposed(by: disposeBag)
  }
}
