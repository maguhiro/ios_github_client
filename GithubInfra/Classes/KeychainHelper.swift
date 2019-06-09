import KeychainAccess

private struct KeychainKey<T: Codable> {
  let key: String
}

enum KeychainHelper {
  private static let keychain = Keychain(service: "com.maguhiro.github-client")
  private static let encoder = JSONEncoder()
  private static let decoder = JSONDecoder()

  private static let keyAccessToken = KeychainKey<String>(key: "access_token")
}

private extension KeychainHelper {
  static func save<T>(key: KeychainKey<T>, value: T) {
    do {
      // プリミティブ型のエンコードに失敗するため、配列に変換
      // https://stackoverflow.com/questions/50257242/jsonencoder-wont-allow-type-encoded-to-primitive-value
      let data = try encoder.encode([value])
      keychain[data: key.key] = data
    } catch {
      log.e(error.localizedDescription)
    }
  }

  static func delete<T>(key: KeychainKey<T>) {
    keychain[key.key] = nil
  }

  static func load<T>(key: KeychainKey<T>) -> T? {
    guard let data = try? keychain.getData(key.key) else {
      return nil
    }

    do {
      let valueList = try decoder.decode([T].self, from: data)
      return valueList.first
    } catch {
      log.e(error.localizedDescription)
      return nil
    }
  }
}

extension KeychainHelper {
  static func saveAccessToken(_ token: String) {
    save(key: keyAccessToken, value: token)
  }

  static func deleteAccessToken() {
    delete(key: keyAccessToken)
  }

  static func loadAccessToken() -> String? {
    return load(key: keyAccessToken)
  }
}
