import GithubUsecase

public final class AccountRepositoryImpl: AccountRepository {
  public init() {}

  public func signIn(accessToken: String) {
    KeychainHelper.saveAccessToken(accessToken)
  }

  public func singOut() {
    KeychainHelper.deleteAccessToken()
  }
}
