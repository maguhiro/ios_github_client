import Foundation

public struct Repository: Entity {
  public let id: RepositoryID
  public let name: String
  public let fullName: String
  public let description: String?
  public let owner: RepositoryOwner
  public let stargazersCount: Int
  public let watchersCount: Int
  public let forksCount: Int
  public let createdAt: Date
  public let updatedAt: Date
}

// extension Repository: Equatable {
//  public static func == (lhs: Repository, rhs: Repository) -> Bool {
//    return lhs.id == rhs.id
//  }
// }
