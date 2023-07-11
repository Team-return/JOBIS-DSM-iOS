import Foundation

public struct BugListEntity: Equatable, Hashable {
    public let bugReports: [BugReportEntity]

    public init(bugReports: [BugReportEntity]) {
        self.bugReports = bugReports
    }
}
