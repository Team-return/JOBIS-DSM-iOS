import Foundation

public struct RecruitmentDetailEntity: Equatable {
    public let areas: [AreaEntity]
    public let preferentialTreatment: String?
    public let requiredGrade: Int?
    public let workHours: Int
    public let requiredLicenses: [String]?
    public let hiringProgress: [String]
    public let trainPay: Int
    public let pay: Int?
    public let benefits: String
    public let military: Bool
    public let submitDocument: String?
    public let startDate, endDate: String
    public let etc: String?

    public init(
        areas: [AreaEntity],
        preferentialTreatment: String?,
        requiredGrade: Int?,
        workHours: Int,
        requiredLicenses: [String]?,
        hiringProgress: [String],
        trainPay: Int,
        pay: Int?,
        benefits: String,
        military: Bool,
        submitDocument: String?,
        startDate: String,
        endDate: String,
        etc: String?
    ) {
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

public struct AreaEntity: Equatable {
    public let recruitAreaID: String
    public let job, tech: [String]
    public let hiring: Int
    public let majorTask: String

    public init(
        recruitAreaID: String,
        job: [String],
        tech: [String],
        hiring: Int,
        majorTask: String
    ) {
        self.recruitAreaID = recruitAreaID
        self.job = job
        self.tech = tech
        self.hiring = hiring
        self.majorTask = majorTask
    }
}
