import Foundation

public struct BugDetailEntity: Equatable {
    public let title: String
    public let content: String
    public let developmentArea: DevelopmentType
    public let attachments: [String]
    public let createdAt: Data

    public init(
        title: String,
        content: String,
        developmentArea: DevelopmentType,
        attachments: [String],
        createdAt: Data
    ) {
        self.title = title
        self.content = content
        self.developmentArea = developmentArea
        self.attachments = attachments
        self.createdAt = createdAt
    }
}
