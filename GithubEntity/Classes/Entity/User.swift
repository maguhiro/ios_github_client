import Foundation

public struct User: Entity {
  public let id: UserID
  public let name: String
  public let createdAt: Date
  public let updatedAt: Date
}

extension User: Equatable {
  public static func == (lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id
  }
}
