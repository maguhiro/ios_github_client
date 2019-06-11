import Foundation

public final class RepositoryResolverHolder {
  public static let shared = RepositoryResolverHolder()

  private var localResolver: RepositoryResolver?
  public var resolver: RepositoryResolver {
    get {
      guard let localResolver = localResolver else {
        fatalError("初期化されていません")
      }
      return localResolver
    }
    set {
      if localResolver != nil {
        fatalError("初期化済みです")
      }
      localResolver = newValue
    }
  }

  private init() {}
}
