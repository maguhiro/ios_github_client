import GithubInfra
import GithubUsecase

final class RepositoryResolverImpl: RepositoryResolver {
  func provideAccountRepository() -> AccountRepository {
    return AccountRepositoryImpl()
  }
}
