import GithubEntity

public struct SearchRepositoryViewModel {
  public let repositoryItemList: [RepositoryItemViewModel]

  init(result: SearchRepositoryResult) {
    self.repositoryItemList = result.items.map { RepositoryItemViewModel(repository: $0) }
  }
}
