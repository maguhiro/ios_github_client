import DIKit
import GithubEntity
import GithubUtility
import RxSwift

public final class RepositorySearchInteractor: RepositorySearchUsecase, Injectable {
  public struct Dependency {
    fileprivate let repositoryRepository: RepositoryRepository

    public init(repositoryRepository: RepositoryRepository) {
      self.repositoryRepository = repositoryRepository
    }
  }

  private let repositoryRepository: RepositoryRepository
  private let disposeBag = DisposeBag()

  public init(dependency: Dependency) {
    self.repositoryRepository = dependency.repositoryRepository
  }

  public func search(query: String,
                     completion: @escaping (Result<SearchRepositoryResult, Error>) -> Void) {
    if query.isEmpty {
      let result = SearchRepositoryResult()
      completion(.success(result))
      return
    }

    repositoryRepository
      .search(query: query)
      .subscribeOn(type: .io)
      .observeOn(type: .main)
      .subscribe(onSuccess: { value in
        log.i(value)
        completion(.success(value))
      },
                 onError: { error in
        log.e(error.localizedDescription)
        completion(.failure(error))
      })
      .disposed(by: disposeBag)
  }
}
