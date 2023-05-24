import Foundation

public struct ApplicationListResponseDTO: Decodable {
    public let applications: [ApplicationResponseDTO]

    public init(applications: [ApplicationResponseDTO]) {
        self.applications = applications
    }
}

public struct ApplicationResponseDTO: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case applicationID = "application_id"
        case company
        case attachmentURLList = "attachment_url_list"
        case applicationStatus = "application_status"
    }
}

public extension ApplicationListResponseDTO {
    func toDomain() -> ApplicationListEntity {
        ApplicationListEntity(applications: applications.map { $0.toDomain() })
    }
}

public extension ApplicationResponseDTO {
    func toDomain() -> ApplicationEntity {
        ApplicationEntity(
            applicationID: applicationID,
            company: company,
            attachmentURLList: attachmentURLList,
            applicationStatus: applicationStatus
        )
    }
}
