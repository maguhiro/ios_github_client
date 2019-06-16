import GithubEntity

public struct RepositoryItemViewModel {
  private let repository: Repository

  init(repository: Repository) {
    self.repository = repository
  }
}

public extension RepositoryItemViewModel {
  var iconURL: URL {
    return repository.owner.avatarUrl
  }

  var repositoryName: String {
    return repository.fullName
  }

  var description: String? {
    return repository.description
  }
}
