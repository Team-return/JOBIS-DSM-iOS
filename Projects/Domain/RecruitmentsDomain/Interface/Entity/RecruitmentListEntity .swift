import Foundation

public struct RecruitmentListEntity: Equatable, Hashable {
    public var recruitments: [RecruitmentEntity]

    public init(recruitments: [RecruitmentEntity]) {
        self.recruitments = recruitments
    }
}

public struct RecruitmentEntity: Equatable, Hashable {
    public let recruitID: Int
    public let companyName: String
    public let companyProfileURL: String
    public let trainPay: Int
    public let military: Bool
    public let totalHiring: Int
    public let jobCodeList: [String]
    public let bookmarked: Bool

    public init(
        recruitID: Int,
        companyName: String,
        companyProfileURL: String,
        trainPay: Int,
        military: Bool,
        totalHiring: Int,
        jobCodeList: [String],
        bookmarked: Bool
    ) {
        self.recruitID = recruitID
        self.companyName = companyName
        self.companyProfileURL = companyProfileURL
        self.trainPay = trainPay
        self.military = military
        self.totalHiring = totalHiring
        self.jobCodeList = jobCodeList
        self.bookmarked = bookmarked
    }
}
