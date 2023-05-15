import Foundation

// swiftlint:disable identifier_name
public enum JobType: String, Decodable {
    case web = "WEB"
    case app = "APP"
    case empedded = "EMBEDDED"
    case security = "SECURITY"
    case ai = "AI"
    case asc = "ASC"
}
