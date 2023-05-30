import Foundation

public extension StudentCompanyResponseDTO {
    func toDomain() -> StudentCompanyListEntity {
        StudentCompanyListEntity(companies: companies.map { $0.toDomain() })
    }
}

public extension CompanyResponseDTO {
    func toDomain() -> CompanyEntity {
        CompanyEntity(
            id: id,
            name: name,
            logoURL: logoURL,
            take: take
        )
    }
}
