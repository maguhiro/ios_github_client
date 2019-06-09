import OAuthSwift

public protocol GithubOAuthDelegate: AnyObject {
  func succeededGithubOAuth(_ oauth: GithubOAuth, accessToken: String)
  func failedGithubOAuth(_ oauth: GithubOAuth, error: Error)
}

public final class GithubOAuth {
  public static let shared = GithubOAuth()

  private let oauth = OAuth2Swift(consumerKey: GithubOAuthConstants.clientID,
                                  consumerSecret: GithubOAuthConstants.clientSecret,
                                  authorizeUrl: "https://github.com/login/oauth/authorize",
                                  accessTokenUrl: "https://github.com/login/oauth/access_token",
                                  responseType: "token")

  public weak var delegate: GithubOAuthDelegate?

  private init() {}

  func authorize() {
    oauth.authorize(withCallbackURL: GithubOAuthConstants.callbackURL,
                    scope: GithubOAuthConstants.scope,
                    state: GithubOAuthConstants.state,
                    success: { credential, _, _ in
                      self.delegate?.succeededGithubOAuth(self, accessToken: credential.oauthToken)
                    },
                    failure: { error in
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
