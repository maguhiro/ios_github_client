import RxCocoa
import RxSwift
import UIKit

final class SearchRepositoryViewController: UIViewController {
  private let searchBar = UISearchBar()
  private let disposeBag = DisposeBag()

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
      .debounce(.milliseconds(100), scheduler: MainScheduler.instance)
      .subscribe(onNext: { text in
        log.i(text)
      })
      .disposed(by: disposeBag)
  }
}
