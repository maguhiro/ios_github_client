import GithubInfra
import GithubUsecase

final class RepositoryResolverImpl: RepositoryResolver {
  private let accountRepository: AccountRepository = AccountRepositoryImpl()

  func provideAccountRepository() -> AccountRepository {
    return accountRepository
  }
}
