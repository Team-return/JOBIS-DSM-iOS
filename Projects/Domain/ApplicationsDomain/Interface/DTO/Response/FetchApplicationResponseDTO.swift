import Foundation

public struct FetchApplicationResponseDTO: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case applicationId = "application_id"
        case student
        case company
        case urlList = "url_list"
        case applicationStatus = "application_status"
    }
}

public extension [FetchApplicationResponseDTO] {
    func toDomain() -> [ApplicationEntity] {
        map { $0.toDomain() }
    }
}

public extension FetchApplicationResponseDTO {
    func toDomain() -> ApplicationEntity {
        ApplicationEntity(
            applicationId: applicationId,
            student: student,
            company: company,
            urlList: urlList,
            applicationStatus: applicationStatus
        )
    }
}
