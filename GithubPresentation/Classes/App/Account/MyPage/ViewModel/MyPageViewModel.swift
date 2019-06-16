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

  var repositorisAmountText: String {
    let repositories = account.user.publicRepos + account.user.totalPrivateRepos
    return "\(repositories)"
  }

  var gistsAmountText: String {
    let gists = account.user.publicGists + account.user.privateGists
    return "\(gists)"
  }

  var followersAmountText: String {
    return "\(account.user.followers)"
  }

  var followingAmountText: String {
    return "\(account.user.following)"
  }
}
