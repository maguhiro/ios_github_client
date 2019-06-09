import GithubView
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setRootViewController()
    return true
  }

  func applicationWillResignActive(_: UIApplication) {}

  func applicationDidEnterBackground(_: UIApplication) {}

  func applicationWillEnterForeground(_: UIApplication) {}

  func applicationDidBecomeActive(_: UIApplication) {}

  func applicationWillTerminate(_: UIApplication) {}

  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    if GithubOAuth.shared.handle(url: url) {
      return true
    }

    return false
  }
}

private extension AppDelegate {
  func setRootViewController() {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = TopViewController()
    window?.makeKeyAndVisible()
  }
}
