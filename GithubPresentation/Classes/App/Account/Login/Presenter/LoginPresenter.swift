import GithubUsecase

public protocol LoginView: AnyObject {
  func succeededSignIn()
}

public final class LoginPresenter {
  private let authorizationUsecase: AuthorizationUsecase = RepositoryResolverHolder.shared.resolver.resolveAuthorizationInteractor()

  public weak var view: LoginView?

  public init() {}
}

// MARK: Viewからの通知

public extension LoginPresenter {
  func signIn(accessToken: String) {
    authorizationUsecase.signIn(accessToken: accessToken)
    view?.succeededSignIn()
  }
}
