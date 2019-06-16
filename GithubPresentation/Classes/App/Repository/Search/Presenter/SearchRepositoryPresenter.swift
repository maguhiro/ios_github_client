import GithubEntity
import GithubUsecase
import RxSwift

public protocol SearchRepositoryView: AnyObject {
  func render(viewModel: SearchRepositoryViewModel)
  func showAlert(title: String?, message: String?)
}

public final class SearchRepositoryPresenter {
  private let searchUsecase: RepositorySearchUsecase = RepositoryResolverHolder.shared.resolver.resolveRepositorySearchInteractor()

  private let disposeBag = DisposeBag()

  public weak var view: SearchRepositoryView?
  private var result = SearchRepositoryResult()

  public init() {}
}

// MARK: Viewからの通知

public extension SearchRepositoryPresenter {
  func showPage() {
    view?.render(viewModel: SearchRepositoryViewModel(result: result))
  }

  func search(query: String) {
    searchUsecase.search(query: query) { [weak self] result in
      switch result {
      case .success(let value):
        self?.result = value
        self?.view?.render(viewModel: SearchRepositoryViewModel(result: value))
      case .failure:
        self?.view?.showAlert(title: "検索に失敗しました", message: nil)
      }
    }
  }
}
