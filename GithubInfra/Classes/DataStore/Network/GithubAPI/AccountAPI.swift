import GithubEntity

struct AccountAPI: GithubAPI {
  typealias Response = User

  let accessToken: String?

  var path: String {
    return "user"
  }

  init(accessToken: String) {
    self.accessToken = accessToken
  }
}
