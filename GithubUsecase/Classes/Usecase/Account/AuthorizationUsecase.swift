import Foundation

public protocol AuthorizationUsecase {
  func signIn(accessToken: String)
  func singOut()
}
