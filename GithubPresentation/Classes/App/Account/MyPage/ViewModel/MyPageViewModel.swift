import GithubEntity

public struct MyPageViewModel {
  private let account: Account

  init(account: Account) {
    self.account = account
  }
}

public extension MyPageViewModel {
  var iconURL: URL {
    return account.user.avatarUrl
  }

  var accountName: String {
    return account.user.login
  }

  var nickname: String {
    return account.user.name
  }
}
