import GithubEntity

public struct RepositoryItemViewModel {
  private let repository: Repository

  init(repository: Repository) {
    self.repository = repository
  }
}

public extension RepositoryItemViewModel {
  var repositoryName: String {
    return repository.fullName
  }
}
