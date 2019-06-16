import Foundation

public struct RepositoryID: ValueObject {
  public let value: Int

  public init(value: Int) {
    self.value = value
  }
}
