import Foundation

public struct StudentCompanyListEntity: Equatable {
    public var companies: [CompanyEntity]

    public init(companies: [CompanyEntity]) {
        self.companies = companies
    }
}
