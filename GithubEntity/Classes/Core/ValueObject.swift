import Foundation

public protocol ValueObject: Codable, CustomStringConvertible, Equatable {
  associatedtype Value: Codable, CustomStringConvertible, Equatable

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

  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.value == rhs.value
  }
}
