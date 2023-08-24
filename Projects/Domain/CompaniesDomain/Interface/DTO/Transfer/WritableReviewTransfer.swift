import Foundation

public extension WritableReviewListResponseDTO {
    func toDomain() -> WritableReviewListEntity {
        WritableReviewListEntity(companies: companies.map { $0.toDomain() })
    }
}

public extension WritableReviewCompanyResponseDTO {
    func toDomain() -> WritableReviewCompanyEntity {
        WritableReviewCompanyEntity(id: id, name: name)
    }
}
