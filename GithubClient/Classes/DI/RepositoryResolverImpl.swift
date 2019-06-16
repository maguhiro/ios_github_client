import GithubInfra
import GithubUsecase

final class RepositoryResolverImpl: RepositoryResolver {
  private let accountRepository: AccountRepository = AccountRepositoryImpl()
  private let repositoryRepository: RepositoryRepository = RepositoryRepositoryImpl()

  func provideAccountRepository() -> AccountRepository {
    return accountRepository
  }

  func provideRepositoryRepository() -> RepositoryRepository {
    return repositoryRepository
  }
}
