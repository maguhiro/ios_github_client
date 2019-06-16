import GithubUsecase

public protocol LoginView: AnyObject {
  func showFullScreenLoading()
  func hideFullScreenLoading()
}

public final class LoginPresenter {
  private let authorizationUsecase: AuthorizationUsecase = RepositoryResolverHolder.shared.resolver.resolveAuthorizationInteractor()

  public weak var view: LoginView?

  public init() {}
}

// MARK: Viewからの通知

public extension LoginPresenter {
  func signIn(accessToken: String) {
    view?.showFullScreenLoading()
    authorizationUsecase.signIn(accessToken: accessToken) { [weak self] result in
      self?.view?.hideFullScreenLoading()
      switch result {
      case .success:
        break
      case .failure:
        break
      }
    }
  }
}
