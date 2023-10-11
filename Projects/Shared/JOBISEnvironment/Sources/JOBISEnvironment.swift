import Foundation

public enum JOBISEnvironment {

    // MARK: - Keys
    public enum UrlKeys: String {
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
    public static func getUrlValue(key: JOBISEnvironment.UrlKeys) -> URL {
        guard let urlString = JOBISEnvironment
            .infoDictionary[key.rawValue] as? String else {
            fatalError("Plist url not found")
        }
        guard let url = URL(string: urlString) else {
            fatalError("\(key.rawValue) is not URL")
        }
        return url
    }

}
