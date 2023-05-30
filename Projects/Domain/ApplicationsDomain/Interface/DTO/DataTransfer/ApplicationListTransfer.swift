import Foundation

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
