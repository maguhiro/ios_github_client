import OAuthSwift

public protocol GithubOAuthDelegate: AnyObject {
  func succeededGithubOAuth(_ oauth: GithubOAuth, accessToken: String)
  func failedGithubOAuth(_ oauth: GithubOAuth, error: Error)
}

public final class GithubOAuth {
  public static let shared = GithubOAuth()
  private let scope = "user"

  private let oauth = OAuth2Swift(consumerKey: GithubOAuthConstants.clientID,
                                  consumerSecret: GithubOAuthConstants.clientSecret,
                                  authorizeUrl: "https://github.com/login/oauth/authorize",
                                  accessTokenUrl: "https://github.com/login/oauth/access_token",
                                  responseType: "token")

  public weak var delegate: GithubOAuthDelegate?

  private init() {}

  func authorize() {
    oauth.authorize(withCallbackURL: GithubOAuthConstants.callbackURL,
                    scope: scope,
                    state: GithubOAuthConstants.state,
                    success: { credential, _, _ in
                      log.d(credential.oauthToken)
                      self.delegate?.succeededGithubOAuth(self, accessToken: credential.oauthToken)
                    },
                    failure: { error in
                      log.e(error.localizedDescription)
                      self.delegate?.failedGithubOAuth(self, error: error)
    })
  }

  public func handle(url: URL) -> Bool {
    if url.scheme == GithubOAuthConstants.callbackURL.scheme {
      OAuthSwift.handle(url: url)
      return true
    }

    return false
  }
}
