import Foundation

public struct StudentCompanyListEntity: Equatable {
    public var companies: [CompanyEntity]

    public init(companies: [CompanyEntity]) {
        self.companies = companies
    }
}

public struct CompanyEntity: Equatable, Hashable {
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
}
