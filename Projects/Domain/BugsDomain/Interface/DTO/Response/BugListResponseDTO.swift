import Foundation

public struct BugListResponseDTO: Decodable {
    public let bugReports: [BugReportResponseDTO]

    public init(bugReports: [BugReportResponseDTO]) {
        self.bugReports = bugReports
    }

    enum CodingKeys: String, CodingKey {
        case bugReports = "bug_reports"
    }
}
