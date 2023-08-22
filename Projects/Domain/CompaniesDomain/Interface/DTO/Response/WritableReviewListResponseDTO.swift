import Foundation

public struct WritableReviewListResponseDTO: Decodable {
    public let companies: [WritableReviewCompanyResponseDTO]

    public init(companies: [WritableReviewCompanyResponseDTO]) {
        self.companies = companies
    }
}
