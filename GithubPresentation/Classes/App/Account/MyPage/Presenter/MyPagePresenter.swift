import GithubUsecase

public final class MyPagePresenter {
  private let authorizationUsecase: AuthorizationUsecase = RepositoryResolverHolder.shared.resolver.resolveAuthorizationInteractor()

  public init() {}
}

// MARK: Viewからの通知

public extension MyPagePresenter {
  func signOut() {
    authorizationUsecase.singOut()
  }
}
