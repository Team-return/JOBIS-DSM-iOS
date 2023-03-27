import Foundation

public enum ApplicationStatusType: String, Decodable {
    case requested = "REQUESTED"
    case approved = "APPROVED"
    case failed = "FAILED"
    case pass = "PASS"
}
