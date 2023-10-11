import Foundation

public enum JOBISEnvironment {

    // MARK: - Keys
    public enum Keys: String {
        case apiBaseUrl = "API_BASE_URL"
        case s3BaseUrl = "S3_BASE_URL"
    }

    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle(identifier: "com.team.return.JOBISEnvironment")?.infoDictionary else {
            fatalError("Plist file not found")
        }

        return dict
    }()

    // MARK: - Get Value
    public static func getValue(key: Keys) -> String {
        let keyValue = JOBISEnvironment.infoDictionary[key.rawValue] as? String ?? ""
        if keyValue.isEmpty {
            fatalError("value is empty")
        }
        return keyValue
    }

}
