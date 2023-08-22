import Foundation

public struct WritableReviewListEntity: Equatable {
    public let companies: [WritableReviewCompanyEntity]

    public init(companies: [WritableReviewCompanyEntity]) {
        self.companies = companies
    }
}
