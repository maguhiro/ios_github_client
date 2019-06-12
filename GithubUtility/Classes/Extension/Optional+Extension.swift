import Foundation

public extension Optional {
  var isNil: Bool {
    return self == nil
  }

  var isSome: Bool {
    return !isNil
  }
}

public extension Optional where Wrapped == String {
  var isBlank: Bool {
    guard let self = self else {
      return true
    }

    return self.isEmpty
  }
}
