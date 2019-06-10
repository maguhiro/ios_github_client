import GithubUsecase

final class AccountRepositoryImpl: AccountRepository {
  func signIn(accessToken: String) {
    KeychainHelper.saveAccessToken(accessToken)
  }

  func singOut() {
    KeychainHelper.deleteAccessToken()
  }
}
