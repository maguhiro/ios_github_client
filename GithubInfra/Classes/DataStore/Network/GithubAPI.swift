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

protocol GithubAPI: URLConvertible {
  associatedtype Response: Codable

  var path: String { get }
  var metthod: HTTPMethod { get }
  var params: [String: Any]? { get }
  var accessToken: String? { get }
}

extension GithubAPI {
  var metthod: HTTPMethod {
    return .get
  }

  var params: [String: Any]? {
    return nil
  }

  var accessToken: String? {
    return KeychainHelper.loadAccount()?.accessToken
  }

  var headers: [String: String]? {
    if let accessToken = self.accessToken {
      return ["Authorization": "token \(accessToken)"]
    }
    return nil
  }

  func asURL() throws -> URL {
    // swiftlint:disable force_unwrapping
    // インスタンス生成できないケースは敢えてクラッシュさせたい
    return URL(string: "https://api.github.com/\(path)")!
    // swiftlint:enable force_unwrapping
  }
}
