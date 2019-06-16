import Foundation

public struct SearchRepositoryResult: Response {
  public let totalCount: Int
  public let items: [Repository]

  public init() {
    self.totalCount = 0
    self.items = []
  }
}
