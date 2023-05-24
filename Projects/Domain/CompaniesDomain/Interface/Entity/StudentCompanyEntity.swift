import Foundation

public struct StudentCompanyEntity: Equatable {
    public let companies: [CompanyEntity]

    public init(companies: [CompanyEntity]) {
        self.companies = companies
    }
}

public struct CompanyEntity: Equatable, Hashable {
    public let name: String
    public let logoURL: String
    public let take: Int

    public init(name: String, logoURL: String, take: Int) {
        self.name = name
        self.logoURL = logoURL
        self.take = take
    }
}
