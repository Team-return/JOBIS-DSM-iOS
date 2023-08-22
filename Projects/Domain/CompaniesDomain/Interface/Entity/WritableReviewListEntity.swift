import Foundation

public struct WritableReviewListEntity: Equatable, Hashable {
    public let companies: [WritableReviewCompanyEntity]

    public init(companies: [WritableReviewCompanyEntity]) {
        self.companies = companies
    }
}
