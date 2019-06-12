import GithubUsecase

public final class AccountRepositoryImpl: AccountRepository {
  public init() {}

  public func signIn(accessToken: String) {
    GithubAPIExecutor.request(api: AccountAPI(accessToken: accessToken)) { result in
      switch result {
      case .success(let value):
        log.i(value.description)
        KeychainHelper.saveAccessToken(accessToken)
      case .failure(let error):
        log.i(error.localizedDescription)
      }
    }
  }

  public func singOut() {
    KeychainHelper.deleteAccessToken()
  }
}
