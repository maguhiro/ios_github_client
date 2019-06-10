import DIKit

public final class AuthorizationInteractor: AuthorizationUsecase, Injectable {
  public struct Dependency {
    fileprivate let accountRepository: AccountRepository

    public init(accountRepository: AccountRepository) {
      self.accountRepository = accountRepository
    }
  }

  private let accountRepository: AccountRepository

  public init(dependency: Dependency) {
    self.accountRepository = dependency.accountRepository
  }

  public init(accountRepository: AccountRepository) {
    self.accountRepository = accountRepository
  }

  public func signIn(accessToken: String) {
    accountRepository.signIn(accessToken: accessToken)
  }

  public func singOut() {
    accountRepository.singOut()
  }
}
