import Foundation
import GithubEntity

public protocol AuthorizationUsecase {
  func signIn(accessToken: String, completion: @escaping (Result<Account, Error>) -> Void)
  func singOut()
}
