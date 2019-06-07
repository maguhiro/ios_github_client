import SwiftyBeaver

public final class Logger {
  public static let shared = Logger()

  public func register(destination: BaseDestination) {
    if !SwiftyBeaver.destinations.contains(destination) {
      SwiftyBeaver.addDestination(destination)
    }
  }

  func unregister(destination: BaseDestination) {
    if SwiftyBeaver.destinations.contains(destination) {
      SwiftyBeaver.removeDestination(destination)
    }
  }
}

// MARK: ログ出力メソッド

public extension Logger {
  func v(_ message: String, context: Any? = nil, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
    print(.verbose, message: message, context: context, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
  }

  func d(_ message: String, context: Any? = nil, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
    print(.debug, message: message, context: context, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
  }

  func i(_ message: String, context: Any? = nil, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
    print(.info, message: message, context: context, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
  }

  func w(_ message: String, context: Any? = nil, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
    print(.warning, message: message, context: context, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
  }

  func e(_ message: String, context: Any? = nil, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
    print(.error, message: message, context: context, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
  }
}

// swiftlint:disable function_parameter_count
// SwiftyBeaverに渡す引数に対応するため
private extension Logger {
  func print(_ logLevel: SwiftyBeaver.Level,
             message: String,
             context: Any?,
             functionName: String,
             fileName: String,
             lineNumber: Int) {
    SwiftyBeaver.custom(level: logLevel, message: message, file: fileName, function: functionName, line: lineNumber, context: context)
  }
}

// swiftlint:enable function_parameter_count
