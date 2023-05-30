import Foundation

public struct ApplicationEntity: Equatable, Hashable {
    public let applicationID: Int
    public let company: String
    public let attachmentURLList: [String]
    public let applicationStatus: ApplicationStatusType

    public init(
        applicationID: Int,
        company: String,
        attachmentURLList: [String],
        applicationStatus: ApplicationStatusType
    ) {
        self.applicationID = applicationID
        self.company = company
        self.attachmentURLList = attachmentURLList
        self.applicationStatus = applicationStatus
    }
}
