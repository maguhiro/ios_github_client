import GithubUsecase

public protocol LoginPresenterView: AnyObject {
  func succeededSignIn()
}

public final class LoginPresenter {
  private let authorizationUsecase: AuthorizationUsecase = RepositoryResolverHolder.shared.resolver.resolveAuthorizationInteractor()

  public weak var view: LoginPresenterView?

  public init() {}
}

// MARK: Viewからの通知

public extension LoginPresenter {
  func singIn(accessToken: String) {
    authorizationUsecase.signIn(accessToken: accessToken)
    view?.succeededSignIn()
  }
}
