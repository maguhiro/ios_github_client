import GithubUsecase

public protocol LoginView: AnyObject {
  func showFullScreenLoading()
  func hideFullScreenLoading(completion: @escaping () -> Void)
  func showAlert(title: String?, message: String?)
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
      self?.view?.hideFullScreenLoading {
        switch result {
        case .success:
          break
        case .failure:
          self?.view?.showAlert(title: "認証に失敗しました", message: nil)
        }
      }
    }
  }
}
