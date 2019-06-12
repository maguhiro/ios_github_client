import Foundation

public struct UserID: Codable {
  public let id: Int

  public init(id: Int) {
    self.id = id
  }
}
