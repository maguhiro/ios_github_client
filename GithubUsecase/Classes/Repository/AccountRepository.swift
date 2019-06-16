import GithubEntity
import RxRelay
import RxSwift

public protocol AccountRepository {
  func accountRelay() -> BehaviorRelay<Account?>
  func load() -> Account?

  func signIn(accessToken: String) -> Single<Account>
  func singOut()
}
