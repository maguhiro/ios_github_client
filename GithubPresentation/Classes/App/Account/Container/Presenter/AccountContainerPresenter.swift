import GithubUsecase
import GithubUtility
import RxRelay
import RxSwift

public protocol AccountContainerView: AnyObject {
  func changeSigninStatus(isLogin: Bool)
}

public final class AccountContainerPresenter {
  private let accountUsecase: AccountUsecase = RepositoryResolverHolder.shared.resolver.resolveAccountInteractor()

  private let disposeBag = DisposeBag()

  public weak var view: AccountContainerView?
  private var isLogined: Bool

  public init() {
    self.isLogined = accountUsecase.accountRelay().value.isLogined
    setupBinding()
  }
}

public extension AccountContainerPresenter {
  func showPage() {
    view?.changeSigninStatus(isLogin: isLogined)
  }
}

private extension AccountContainerPresenter {
  func setupBinding() {
    accountUsecase
      .accountRelay()
      .observeOn(type: .main)
      .subscribe(onNext: { [weak self] account in
        self?.isLogined = account.isLogined
        self?.view?.changeSigninStatus(isLogin: account.isLogined)
      })
      .disposed(by: disposeBag)
  }
}
