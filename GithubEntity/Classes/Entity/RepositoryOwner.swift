import Foundation

public struct RepositoryOwner: Entity {
  public let id: UserID
  public let login: String
  public let avatarUrl: URL
}

extension RepositoryOwner: Equatable {
  public static func == (lhs: RepositoryOwner, rhs: RepositoryOwner) -> Bool {
    return lhs.id == rhs.id
  }
}
