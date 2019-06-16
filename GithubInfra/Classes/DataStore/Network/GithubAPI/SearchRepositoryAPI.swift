import Foundation

import GithubEntity

struct SearchRepositoryAPI: GithubAPI {
  typealias Response = SearchRepositoryResult

  let query: String

  var path: String {
    return "search/repositories"
  }

  var params: [String: Any]? {
    return ["q": query]
  }

  init(query: String) {
    self.query = query
  }
}
