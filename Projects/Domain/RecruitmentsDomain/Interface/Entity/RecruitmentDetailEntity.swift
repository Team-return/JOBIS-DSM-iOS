import Foundation

public struct RecruitmentDetailEntity: Equatable {
    public let companyID: Int
    public let areas: [AreaEntity]
    public let preferentialTreatment: String
    public let requiredGrade: Int?
    public let workHours: String
    public let requiredLicenses: String
    public let hiringProgress: String
    public let trainPay: String
    public let pay: Int?
    public let benefits: String
    public let military: Bool
    public let submitDocument: String
    public let startDate, endDate: String
    public let etc: String

    public init(
        companyID: Int,
        areas: [AreaEntity],
        preferentialTreatment: String,
        requiredGrade: Int?,
        workHours: String,
        requiredLicenses: String,
        hiringProgress: String,
        trainPay: String,
        pay: Int?,
        benefits: String,
        military: Bool,
        submitDocument: String,
        startDate: String,
        endDate: String,
        etc: String
    ) {
        self.companyID = companyID
        self.areas = areas
        self.preferentialTreatment = preferentialTreatment
        self.requiredGrade = requiredGrade
        self.workHours = workHours
        self.requiredLicenses = requiredLicenses
        self.hiringProgress = hiringProgress
        self.trainPay = trainPay
        self.pay = pay
        self.benefits = benefits
        self.military = military
        self.submitDocument = submitDocument
        self.startDate = startDate
        self.endDate = endDate
        self.etc = etc
    }
}

public struct AreaEntity: Equatable, Hashable {
    public let id: String
    public let job: String
    public let tech: [String]
    public let hiring: Int
    public let majorTask: String

    public init(
        id: String,
        job: String,
        tech: [String],
        hiring: Int,
        majorTask: String
    ) {
        self.id = id
        self.job = job
        self.tech = tech
        self.hiring = hiring
        self.majorTask = majorTask
    }
}
