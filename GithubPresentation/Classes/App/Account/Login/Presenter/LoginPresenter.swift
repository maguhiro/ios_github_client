import GithubUsecase

public final class LoginPresenter {
  private let authorizationUsecase: AuthorizationUsecase = RepositoryResolverHolder.shared.resolver.resolveAuthorizationInteractor()
}
