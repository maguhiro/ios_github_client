import Foundation

public protocol ValueObject: Codable, CustomStringConvertible {
  associatedtype Value: Codable, CustomStringConvertible

  var value: Value { get }

  init(value: Value)
}

public extension ValueObject {
  init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer()
    let decodeValue = try value.decode(Value.self)
    self.init(value: decodeValue)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(value)
  }

  var description: String {
    return value.description
  }
}
