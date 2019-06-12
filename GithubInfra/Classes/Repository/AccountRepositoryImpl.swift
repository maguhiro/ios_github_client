import GithubEntity
import GithubUsecase

public final class AccountRepositoryImpl: AccountRepository {
  public init() {}

  public func signIn(accessToken: String) {
    GithubAPIExecutor.request(api: AccountAPI(accessToken: accessToken)) { result in
      switch result {
      case .success(let user):
        let account = Account(accessToken: accessToken, user: user)
        log.i(account)
        KeychainHelper.saveAccount(account)
      case .failure(let error):
        log.i(error.localizedDescription)
      }
    }
  }

  public func singOut() {
    KeychainHelper.deleteAccount()
  }
}
