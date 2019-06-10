import Foundation

public final class AuthorizationInteractor: AuthorizationUsecase {
  let accountRepository: AccountRepository

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
