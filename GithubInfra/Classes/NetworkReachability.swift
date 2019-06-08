import Reachability

final class NetworkReachability {
  private static let shared = NetworkReachability()

  private let reachability = Reachability()

  var isConnected: Bool {
    guard let reachability = reachability else {
      return false
    }

    switch reachability.connection {
    case .cellular, .wifi:
      return true
    case .none:
      return false
    }
  }
}
