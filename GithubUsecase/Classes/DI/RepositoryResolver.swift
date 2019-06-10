import DIKit

public protocol RepositoryResolver: Resolver {
  func provideAccountRepository() -> AccountRepository
}
