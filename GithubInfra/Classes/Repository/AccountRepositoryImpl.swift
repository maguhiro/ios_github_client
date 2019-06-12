import GithubEntity
import GithubUsecase
import RxRelay
import RxSwift

public final class AccountRepositoryImpl: AccountRepository {
  public init() {}

  private let relay: BehaviorRelay<Account?> = BehaviorRelay(value: KeychainHelper.loadAccount())

  public func accountRelay() -> BehaviorRelay<Account?> {
    return relay
  }

  public func signIn(accessToken: String) -> Single<Account> {
    return GithubAPIExecutor.request(api: AccountAPI(accessToken: accessToken))
      .map { Account(accessToken: accessToken, user: $0) }
      .do(onSuccess: { account in
        log.i(account)
        KeychainHelper.saveAccount(account)
        self.relay.accept(account)
      },
          onError: { error in
        log.i(error.localizedDescription)
      })
  }

  public func singOut() {
    KeychainHelper.deleteAccount()
    relay.accept(nil)
  }
}
