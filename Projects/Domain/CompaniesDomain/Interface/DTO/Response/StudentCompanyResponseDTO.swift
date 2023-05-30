import Foundation

public struct StudentCompanyResponseDTO: Decodable {
    public let companies: [CompanyResponseDTO]

    public init(companies: [CompanyResponseDTO]) {
        self.companies = companies
    }
}
