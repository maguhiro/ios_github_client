import GithubEntity
import GithubUsecase
import RxSwift

public protocol SearchRepositoryView: AnyObject {
  func render()
  func showAlert(title: String?, message: String?)
}

public final class SearchRepositoryPresenter {
  private let searchUsecase: RepositorySearchUsecase = RepositoryResolverHolder.shared.resolver.resolveRepositorySearchInteractor()

  private let disposeBag = DisposeBag()

  public weak var view: SearchRepositoryView?
  private var result: SearchRepositoryResult?

  public init() {}
}

// MARK: Viewからの通知

public extension SearchRepositoryPresenter {
  func search(query: String) {
    searchUsecase.search(query: query) { [weak self] result in
      switch result {
      case .success(let value):
        log.i(value)
      case .failure:
        self?.view?.showAlert(title: "検索に失敗しました", message: nil)
      }
    }
  }
}
