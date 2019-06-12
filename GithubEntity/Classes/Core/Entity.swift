import GithubUtility

public protocol Entity: Codable, CustomStringConvertible {}

public extension Entity {
  var description: String {
    let typeName = String(describing: type(of: self))
    guard let data = try? CodableConstants.encoder.encode(self) else {
      return "\(typeName) : エンコードに失敗"
    }
    guard let json = String(data: data, encoding: .utf8) else {
      return "\(typeName) : String変換に失敗"
    }

    return "\(typeName) : \(json)"
  }
}
