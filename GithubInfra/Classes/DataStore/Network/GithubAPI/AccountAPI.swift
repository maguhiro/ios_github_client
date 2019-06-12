import Foundation

struct User: Codable {
  let id: Int
  let name: String
}

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
