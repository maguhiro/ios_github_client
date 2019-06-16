import GithubEntity
import GithubUsecase
import RxSwift

public final class RepositoryRepositoryImpl: RepositoryRepository {
  public init() {}

  public func search(query: String) -> Single<SearchRepositoryResult> {
    return GithubAPIExecutor.request(api: SearchRepositoryAPI(query: query))
  }
}
