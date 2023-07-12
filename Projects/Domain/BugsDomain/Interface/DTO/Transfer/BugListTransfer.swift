import Foundation

public extension BugListResponseDTO {
    func toDomain() -> BugListEntity {
        BugListEntity(bugReports: bugReports.map { $0.toDomain() })
    }
}

public extension BugReportResponseDTO {
    func toDomain() -> BugReportEntity {
        BugReportEntity(
            id: id,
            title: title,
            developmentArea: developmentArea,
            createdAt: createdAt
        )
    }
}
