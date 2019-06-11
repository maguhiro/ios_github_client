import Alamofire

enum HTTPMethod {
  case get
  case post

  var alamofireMethod: Alamofire.HTTPMethod {
    switch self {
    case .get:
      return .get
    case .post:
      return .post
    }
  }
}

protocol GithubAPI {
  associatedtype Response: Codable

  var path: String { get }
  var metthod: HTTPMethod { get }
  var params: [String: Any]? { get }
}

extension GithubAPI {
  var url: URL {
    // swiftlint:disable force_unwrapping
    // インスタンス生成できないケースは敢えてクラッシュさせたい
    return URL(string: "https://api.github.com/\(path)")!
    // swiftlint:enable force_unwrapping
  }

  var headers: [String: String]? {
    if let accessToken = KeychainHelper.loadAccessToken() {
      return ["Authorization": "token \(accessToken)"]
    }
    return nil
  }
}
