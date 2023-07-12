import Foundation

public struct ApplicationEntity: Equatable, Hashable {
    public let applicationID: Int
    public let company: String
    public let attachments: [AttachmentsResponseDTO]
    public let applicationStatus: ApplicationStatusType

    public init(
        applicationID: Int,
        company: String,
        attachments: [AttachmentsResponseDTO],
        applicationStatus: ApplicationStatusType
    ) {
        self.applicationID = applicationID
        self.company = company
        self.attachments = attachments
        self.applicationStatus = applicationStatus
    }
}
