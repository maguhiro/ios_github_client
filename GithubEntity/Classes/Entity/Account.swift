import Foundation

public struct Account: Entity {
  public let accessToken: String
  public let user: User

  public init(accessToken: String,
              user: User) {
    self.accessToken = accessToken
    self.user = user
  }
}

public extension Optional where Wrapped == Account {
  var isLogined: Bool {
    return self != nil
  }
}
