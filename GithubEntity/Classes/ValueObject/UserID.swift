import Foundation

public struct UserID: ValueObject {
  public let value: Int

  public init(value: Int) {
    self.value = value
  }
}

extension UserID: Equatable {
  public static func == (lhs: UserID, rhs: UserID) -> Bool {
    return lhs.value == rhs.value
  }
}
