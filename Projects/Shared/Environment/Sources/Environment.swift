import Foundation

public enum Environment {

    // MARK: - Keys
    public enum UrlKeys: String {
        case apiBaseUrl = "API_BASE_URL"
        case s3BaseUrl = "S3_BASE_URL"
    }

    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle(identifier: "com.team.return.Environment")?.infoDictionary else {
            fatalError("Plist file not found")
        }

        return dict
    }()

    // MARK: - Get Value
    public static func getUrlValue(key: Environment.UrlKeys) -> URL? {
        return URL(string: Environment.infoDictionary[key.rawValue] as? String ?? "")
    }

}
