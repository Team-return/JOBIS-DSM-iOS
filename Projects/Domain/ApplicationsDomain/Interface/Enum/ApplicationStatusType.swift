public enum ApplicationStatusType: String, Codable {
    case requested = "REQUESTED"
    case approved = "APPROVED"
    case failed = "FAILED"
    case pass = "PASS"
}
