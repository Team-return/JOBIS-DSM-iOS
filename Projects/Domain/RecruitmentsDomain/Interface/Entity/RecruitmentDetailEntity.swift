import Foundation

public struct RecruitmentDetailEntity: Equatable {
    let areas: [AreaEntity]
    let preferentialTreatment: String?
    let requiredGrade: Int?
    let workHours: Int
    let requiredLicenses: [String]?
    let hiringProgress: [String]
    let trainPay: Int
    let pay: Int?
    let benefits: String
    let military: Bool
    let submitDocument: String?
    let startDate, endDate: String
    let etc: String?
}

public struct AreaEntity: Equatable {
    let recruitAreaID: String
    let job, tech: [String]
    let hiring: Int
    let majorTask: String
}
