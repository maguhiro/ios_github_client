import GithubPresentation
import RxCocoa
import RxSwift
import UIKit

final class SearchRepositoryViewController: UIViewController {
  private let disposeBag = DisposeBag()
  private let presenter = SearchRepositoryPresenter()

  private let searchBar = UISearchBar()
  @IBOutlet private var tableView: UITableView!

  private var viewModel: SearchRepositoryViewModel?

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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.view = self
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    presenter.view = nil
  }
}

private extension SearchRepositoryViewController {
  func initalizeView() {
    tableView.delegate = self
    tableView.dataSource = self

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

extension SearchRepositoryViewController: SearchRepositoryView {
  func render(viewModel: SearchRepositoryViewModel) {
    self.viewModel = viewModel
    tableView.reloadData()
  }

  func showAlert(title: String?, message: String?) {
    let alert = UIAlertController.makeOKAlert(title: title, message: message)
    present(alert, animated: true)
  }
}

extension SearchRepositoryViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel?.repositoryItemList.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.text = viewModel?.repositoryItemList[indexPath.row].repositoryName
    return cell
  }
}
