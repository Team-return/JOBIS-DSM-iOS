import Foundation

public struct ApplyCompanyRequestDTO: Encodable {
    public let attachmentURL: String

    public init(attachmentURL: String) {
        self.attachmentURL = attachmentURL
    }

    enum CodingKeys: String, CodingKey {
        case attachmentURL = "attachment_url"
    }
}
