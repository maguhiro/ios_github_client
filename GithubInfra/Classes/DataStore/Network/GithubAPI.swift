import Foundation

enum HTTPMethod {
  case get
  case post
}

protocol GithubAPI {
  var path: String { get }
  var metthod: HTTPMethod { get }
  var params: [String: String] { get }
}
