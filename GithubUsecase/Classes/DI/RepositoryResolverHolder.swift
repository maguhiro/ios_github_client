import Foundation

public final class RepositoryResolverHolder {
  public static let shared = RepositoryResolverHolder()

  public var resolver: RepositoryResolver {
    guard let innerResolver = innerResolver else {
      fatalError("初期化されていません")
    }
    return innerResolver
  }

  private var innerResolver: RepositoryResolver?

  private init() {}

  public func setUp(resolver: RepositoryResolver) {
    innerResolver = resolver
  }
}
