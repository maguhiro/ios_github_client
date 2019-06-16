import DIKit
import GithubEntity
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

  public func signIn(accessToken: String, completion: @escaping (Result<Account, Error>) -> Void) {
    accountRepository
      .signIn(accessToken: accessToken)
      .observeOn(MainScheduler.instance)
      .subscribe(onSuccess: { value in
        completion(.success(value))
      },
                 onError: { error in
        completion(.failure(error))
      })
      .disposed(by: disposeBag)
  }

  public func singOut() {
    accountRepository.singOut()
  }
}
