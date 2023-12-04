import Foundation

public struct RecruitmentResponseDTO: Codable {
    public let recruitID: Int
    public let companyName: String
    public let companyProfileURL: String
    public let trainPay: Int
    public let militarySupport: Bool
    public let hiringJobs: String
    public let bookmarked: Bool

    public init(
        recruitID: Int,
        companyName: String,
        companyProfileURL: String,
        trainPay: Int,
        militarySupport: Bool,
        hiringJobs: String,
        bookmarked: Bool
    ) {
        self.recruitID = recruitID
        self.companyName = companyName
        self.companyProfileURL = companyProfileURL
        self.trainPay = trainPay
        self.militarySupport = militarySupport
        self.hiringJobs = hiringJobs
        self.bookmarked = bookmarked
    }

    enum CodingKeys: String, CodingKey {
        case recruitID = "id"
        case companyName = "company_name"
        case companyProfileURL = "company_profile_url"
        case trainPay = "train_pay"
        case militarySupport = "military_support"
        case hiringJobs = "hiring_jobs"
        case bookmarked
    }
}
