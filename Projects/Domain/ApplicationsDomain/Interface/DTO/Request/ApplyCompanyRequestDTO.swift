import Foundation

public struct ApplyCompanyRequestDTO: Encodable {
    public let attachments: [AttachmentsRequestDTO]

    public init(attachments: [AttachmentsRequestDTO]) {
        self.attachments = attachments
    }
}

public struct AttachmentsRequestDTO: Encodable {
    public let url: String
    public let type: AttachmentType

    public init(url: String, type: AttachmentType) {
        self.url = url
        self.type = type
    }
}
