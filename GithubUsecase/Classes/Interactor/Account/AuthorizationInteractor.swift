import DIKit
import RxSwift

public final class AuthorizationInteractor: AuthorizationUsecase, Injectable {
  public struct Dependency {
    fileprivate let accountRepository: AccountRepository

    public init(accountRepository: AccountRepository) {
      self.accountRepository = accountRepository
    }
  }

  private let accountRepository: AccountRepository
  private let disposeBag = DisposeBag()

  public init(dependency: Dependency) {
    self.accountRepository = dependency.accountRepository
  }

  public func signIn(accessToken: String) {
    accountRepository
      .signIn(accessToken: accessToken)
      .subscribe(onSuccess: { _ in
        log.i("成功")
      },
                 onError: { _ in
        log.i("失敗")
      })
      .disposed(by: disposeBag)
  }

  public func singOut() {
    accountRepository.singOut()
  }
}
