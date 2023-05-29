import Foundation

public struct RecruitmentDetailResponseDTO: Decodable {
    public let companyID: Int
    public let areas: [AreaResponseDTO]
    public let preferentialTreatment: String?
    public let requiredGrade: Int?
    public let workHours: Int
    public let requiredLicenses: [String]?
    public let hiringProgress: [InterviewType]
    public let trainPay: Int
    public let pay: Int?
    public let benefits: String?
    public let military: Bool
    public let submitDocument: String
    public let startDate, endDate: String
    public let etc: String?

    public init(
        companyID: Int,
        areas: [AreaResponseDTO],
        preferentialTreatment: String?,
        requiredGrade: Int?,
        workHours: Int,
        requiredLicenses: [String]?,
        hiringProgress: [InterviewType],
        trainPay: Int,
        pay: Int?,
        benefits: String?,
        military: Bool,
        submitDocument: String,
        startDate: String,
        endDate: String,
        etc: String?
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

    enum CodingKeys: String, CodingKey {
        case companyID = "company_id"
        case areas
        case preferentialTreatment = "preferential_treatment"
        case requiredGrade = "required_grade"
        case workHours = "work_hours"
        case requiredLicenses = "required_licenses"
        case hiringProgress = "hiring_progress"
        case trainPay = "train_pay"
        case pay, benefits, military
        case submitDocument = "submit_document"
        case startDate = "start_date"
        case endDate = "end_date"
        case etc
    }
}

public struct AreaResponseDTO: Decodable {
    public let id: Int
    public let job: String
    public let tech: [String]
    public let hiring: Int
    public let majorTask: String

    public init(
        id: Int,
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

    enum CodingKeys: String, CodingKey {
        case id, job, tech, hiring
        case majorTask = "major_task"
    }
}

public extension RecruitmentDetailResponseDTO {
    func toDomain() -> RecruitmentDetailEntity {
        RecruitmentDetailEntity(
            companyID: companyID,
            areas: areas.map { $0.toDomain() },
            preferentialTreatment: preferentialTreatment ?? "없음",
            requiredGrade: requiredGrade,
            workHours: String(workHours),
            requiredLicenses: requiredLicenses?.joined(separator: ", ") ?? "없음",
            hiringProgress: hiringProgress.enumerated().map { (index, value) in
                "\(index + 1). \(value.localizedString())"
            }.joined(separator: "\n"),
            trainPay: String(trainPay),
            pay: pay,
            benefits: benefits ?? "없음",
            military: military,
            submitDocument: submitDocument,
            startDate: startDate,
            endDate: endDate,
            etc: etc ?? "없음"
        )
    }
}

public extension AreaResponseDTO {
    func toDomain() -> AreaEntity {
        AreaEntity(
            id: String(id),
            job: job,
            tech: tech,
            hiring: hiring,
            majorTask: majorTask
        )
    }
}
