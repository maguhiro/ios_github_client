import GithubEntity
import RxSwift

public protocol RepositoryRepository {
  func search(query: String) -> Single<SearchRepositoryResult>
}
