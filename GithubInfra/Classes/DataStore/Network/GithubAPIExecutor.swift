import Alamofire
import RxSwift

enum GithubAPIExecutorError: Error {
  case unconnectedNetwork
  case noneBody
}

enum GithubAPIExecutor {
  @discardableResult
  static func request<T: GithubAPI>(api: T,
                                    handler: @escaping (Swift.Result<T.Response, Error>) -> Void) -> DataRequest? {
    if !NetworkReachability.shared.isConnected {
      handler(.failure(GithubAPIExecutorError.unconnectedNetwork))
      return nil
    }

    return Alamofire
      .request(api.url, method: api.metthod.alamofireMethod, parameters: api.params, headers: api.headers)
      .responseJSON { response in
        if let error = response.error {
          handler(.failure(error))
          return
        }

        guard let data = response.data else {
          handler(.failure(GithubAPIExecutorError.noneBody))
          return
        }

        let decoder = JSONDecoder()
        do {
          let result: T.Response = try decoder.decode(T.Response.self, from: data)
          handler(.success(result))
        } catch {
          handler(.failure(error))
        }
      }
  }
}

extension GithubAPIExecutor {
  static func request<T: GithubAPI>(api: T) -> Single<T.Response> {
    return Single.create { event in
      let dataRequest = request(api: api) { result in
        switch result {
        case .success(let value):
          event(.success(value))
        case .failure(let error):
          event(.error(error))
        }
      }

      return Disposables.create {
        dataRequest?.cancel()
      }
    }
  }
}
