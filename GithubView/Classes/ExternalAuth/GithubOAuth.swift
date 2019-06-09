import OAuthSwift

public final class GithubOAuth {
  public static let shared = GithubOAuth()

  private init() {}

  private let oauth = OAuth2Swift(consumerKey: GithubOAuthConstants.clientID,
                                  consumerSecret: GithubOAuthConstants.clientSecret,
                                  authorizeUrl: "https://github.com/login/oauth/authorize",
                                  accessTokenUrl: "https://github.com/login/oauth/access_token",
                                  responseType: "token")

  func authorize() {
    oauth.authorize(withCallbackURL: GithubOAuthConstants.callbackURL,
                    scope: GithubOAuthConstants.scope,
                    state: GithubOAuthConstants.state,
                    success: { credential, _, _ in
                      print(credential.oauthToken)
                    },
                    failure: { error in
                      print(error.localizedDescription)
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
