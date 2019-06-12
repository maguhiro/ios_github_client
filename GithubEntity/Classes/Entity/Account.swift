import Foundation

public struct Account: Codable {
  public let accessToken: String
  public let user: User

  public init(accessToken: String,
              user: User) {
    self.accessToken = accessToken
    self.user = user
  }
}
