import GithubEntity

public protocol RepositorySearchUsecase {
  func search(query: String,
              completion: @escaping (Result<SearchRepositoryResult, Error>) -> Void)
}
