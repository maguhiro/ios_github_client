import GithubEntity
import RxRelay

public protocol AccountUsecase {
  func accountRelay() -> BehaviorRelay<Account?>
}
