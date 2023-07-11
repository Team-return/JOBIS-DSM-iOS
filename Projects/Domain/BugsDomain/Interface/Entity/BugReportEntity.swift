import Foundation

public struct BugReportEntity: Equatable, Hashable {
    public let id: Int
    public let title: String
    public let developmentArea: DevelopmentType
    public let createdAt: Data

    public init(
        id: Int,
        title: String,
        developmentArea: DevelopmentType,
        createdAt: Data
    ) {
        self.id = id
        self.title = title
        self.developmentArea = developmentArea
        self.createdAt = createdAt
    }
}
