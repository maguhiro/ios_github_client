import GithubEntity
import GithubUsecase
import RxSwift

public protocol MyPageView: AnyObject {
  func render(viewModel: MyPageViewModel)
}

public final class MyPagePresenter {
  private let accountUsecase: AccountUsecase = RepositoryResolverHolder.shared.resolver.resolveAccountInteractor()
  private let authorizationUsecase: AuthorizationUsecase = RepositoryResolverHolder.shared.resolver.resolveAuthorizationInteractor()

  private let disposeBag = DisposeBag()

  public weak var view: MyPageView?
  private var account: Account?

  public init() {
    self.account = accountUsecase.load()
    setupBinding()
  }
}

// MARK: 初期化処理

private extension MyPagePresenter {
  func setupBinding() {
    accountUsecase
      .accountRelay()
      .observeOn(type: .main)
      .subscribe(onNext: { [weak self] account in
        self?.account = account
        self?.notifyAccount()
      })
      .disposed(by: disposeBag)
  }
}

// MARK: Viewからの通知

public extension MyPagePresenter {
  func signOut() {
    authorizationUsecase.singOut()
  }

  func showPage() {
    notifyAccount()
  }
}

// MARK: Privateな関数

private extension MyPagePresenter {
  func notifyAccount() {
    guard let account = account else {
      return
    }

    let viewModel = MyPageViewModel(account: account)
    view?.render(viewModel: viewModel)
  }
}
