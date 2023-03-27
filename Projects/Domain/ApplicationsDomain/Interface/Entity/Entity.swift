import Foundation

public struct ApplicationEntity: Equatable {
    public let applicationId: String
    public let student: String
    public let company: String
    public let urlList: [String]
    public let applicationStatus: ApplicationStatusType

    public init(
        applicationId: String,
        student: String,
        company: String,
        urlList: [String],
        applicationStatus: ApplicationStatusType
    ) {
        self.applicationId = applicationId
        self.student = student
        self.company = company
        self.urlList = urlList
        self.applicationStatus = applicationStatus
    }
}
