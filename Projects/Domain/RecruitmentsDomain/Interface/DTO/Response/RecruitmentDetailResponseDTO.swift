import Foundation

public struct RecruitmentDetailResponseDTO: Decodable {
    let areas: [AreaResponseDTO]
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

    enum CodingKeys: String, CodingKey {
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
    let recruitAreaID: String
    let job, tech: [String]
    let hiring: Int
    let majorTask: String

    enum CodingKeys: String, CodingKey {
        case recruitAreaID = "recruit_area_id"
        case job, tech, hiring
        case majorTask = "major_task"
    }
}

public extension RecruitmentDetailResponseDTO {
    func toDomain() -> RecruitmentDetailEntity {
        RecruitmentDetailEntity(
            areas: areas.map { $0.toDomain() },
            preferentialTreatment: preferentialTreatment,
            requiredGrade: requiredGrade,
            workHours: workHours,
            requiredLicenses: requiredLicenses,
            hiringProgress: hiringProgress,
            trainPay: trainPay,
            pay: pay,
            benefits: benefits,
            military: military,
            submitDocument: submitDocument,
            startDate: startDate,
            endDate: endDate,
            etc: etc
        )
    }
}

public extension AreaResponseDTO {
    func toDomain() -> AreaEntity {
        AreaEntity(
            recruitAreaID: recruitAreaID,
            job: job,
            tech: tech,
            hiring: hiring,
            majorTask: majorTask
        )
    }
}
