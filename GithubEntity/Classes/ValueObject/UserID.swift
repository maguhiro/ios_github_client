import Foundation

public struct UserID: ValueObject {
  public let value: Int

  public init(value: Int) {
    self.value = value
  }
}
