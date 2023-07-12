import Foundation

public struct BugReportResponseDTO: Decodable {
    public let id: Int
    public let title: String
    public let developmentArea: DevelopmentType
    public let createdAt: String

    public init(
        id: Int,
        title: String,
        developmentArea: DevelopmentType,
        createdAt: String
    ) {
        self.id = id
        self.title = title
        self.developmentArea = developmentArea
        self.createdAt = createdAt
    }

    public enum CodingKeys: String, CodingKey {
        case id, title
        case developmentArea = "development_area"
        case createdAt = "created_at"
    }
}
