import SwiftyBeaver

struct LoggingSetting {
  private static let format = "$DHH:mm:ss$d $C$L$c $N.$F:$l [$T] - $M $X"

  private static let console: ConsoleDestination = {
    let console = ConsoleDestination()
    console.asynchronously = true
    console.minLevel = .debug
    console.format = format
    return console
  }()

  private init() {}

  static func setUp() {
    log.register(destination: console)
  }
}
