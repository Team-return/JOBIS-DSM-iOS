import Foundation

public struct ReportBugsRequestDTO: Encodable {
    public let title: String
    public let content: String
    public let developmentArea: DevelopmentType
    public let attachmentUrls: [String]

    public init(
        title: String,
        content: String,
        developmentArea: DevelopmentType,
        attachmentUrls: [String]
    ) {
        self.title = title
        self.content = content
        self.developmentArea = developmentArea
        self.attachmentUrls = attachmentUrls
    }

    enum CodingKeys: String, CodingKey {
        case title, content
        case developmentArea = "development_area"
        case attachmentUrls = "attachment_urls"
    }
}
