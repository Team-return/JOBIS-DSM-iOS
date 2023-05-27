import Foundation

public struct StudentCompanyResponseDTO: Decodable {
    public let companies: [CompanyResponseDTO]

    public init(companies: [CompanyResponseDTO]) {
        self.companies = companies
    }
}

public struct CompanyResponseDTO: Decodable {
    public let id: Int
    public let name: String
    public let logoURL: String
    public let take: Int

    public init(id: Int, name: String, logoURL: String, take: Int) {
        self.id = id
        self.name = name
        self.logoURL = logoURL
        self.take = take
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoURL = "logo_url"
        case take
    }
}

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
