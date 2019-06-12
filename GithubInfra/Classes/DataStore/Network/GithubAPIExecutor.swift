import Alamofire
import GithubUtility
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
      .request(api, method: api.metthod.alamofireMethod, parameters: api.params, headers: api.headers)
      .responseJSON { response in
        handler(handle(response: response))
      }
  }
}

private extension GithubAPIExecutor {
  static func handle<T: Codable>(response: DataResponse<Any>) -> Swift.Result<T, Error> {
    if let url = response.request?.url {
      log.d("API Call : \(url)")
    }
    log.d(response.description)

    switch response.result {
    case .failure(let error):
      log.e(error.localizedDescription)
      return .failure(error)
    case .success:
      guard let data = response.data else {
        return .failure(GithubAPIExecutorError.noneBody)
      }

      do {
        let result: T = try CodableConstants.decoder.decode(T.self, from: data)
        return .success(result)
      } catch {
        log.e(error.localizedDescription)
        return .failure(error)
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
