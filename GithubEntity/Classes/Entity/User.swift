import Foundation

public struct User: Entity {
  public let id: UserID
  public let name: String
  public let avatarUrl: URL
  public let publicRepos: Int
  public let totalPrivateRepos: Int
  public let publicGists: Int
  public let privateGists: Int
  public let followers: Int
  public let following: Int
  public let createdAt: Date
  public let updatedAt: Date
}

extension User: Equatable {
  public static func == (lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id
  }
}
