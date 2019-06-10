import Foundation

public protocol AccountRepository {
  func signIn(accessToken: String)
  func singOut()
}
