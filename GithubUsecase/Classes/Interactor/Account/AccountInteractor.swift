import DIKit
import GithubEntity
import RxRelay

public final class AccountInteractor: AccountUsecase, Injectable {
  public struct Dependency {
    fileprivate let accountRepository: AccountRepository

    public init(accountRepository: AccountRepository) {
      self.accountRepository = accountRepository
    }
  }

  private let accountRepository: AccountRepository

  public init(dependency: Dependency) {
    self.accountRepository = dependency.accountRepository
  }

  public func accountRelay() -> BehaviorRelay<Account?> {
    return accountRepository.accountRelay()
  }

  public func load() -> Account? {
    return accountRepository.load()
  }
}
