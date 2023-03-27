import JwtStoreInterface

final class DictionaryJwtStore: Keychain {
    private var dictionary = [String: String]()

    func save(type: KeychainType, value: String) {
        dictionary[type.rawValue] = value
    }

    func load(type: KeychainType) -> String {
        dictionary[type.rawValue] ?? ""
    }

    func delete(type: KeychainType) {
        dictionary.removeValue(forKey: type.rawValue)
    }
}
