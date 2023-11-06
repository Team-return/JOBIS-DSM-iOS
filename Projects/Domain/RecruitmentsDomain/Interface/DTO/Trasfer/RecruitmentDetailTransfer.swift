import Foundation

public extension RecruitmentDetailResponseDTO {
    func toDomain() -> RecruitmentDetailEntity {
        var unwrappedRequiredGrade: String? {
            guard let requiredGrade else { return nil }
            return String(requiredGrade) + "% 이내"
        }
        var workTime: String {
            [startTime, endTime].map {
                $0.components(separatedBy: ":")[0...1].joined(separator: ":")
            }.joined(separator: " ~ ")
        }
        return RecruitmentDetailEntity(
            companyID: companyID,
            companyProfileUrl: companyProfileUrl,
            companyName: companyName,
            areas: areas.map { $0.toDomain() },
            requiredGrade: unwrappedRequiredGrade,
            workTime: workTime,
            requiredLicenses: requiredLicenses?.joined(separator: ", "),
            hiringProgress: hiringProgress.enumerated().map { (index, value) in
                "\(index + 1). \(value.localizedString())"
            }.joined(separator: "\n"),
            trainPay: String(trainPay),
            pay: pay,
            benefits: benefits,
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
            job: job.joined(separator: ", "),
            tech: tech,
            hiring: hiring,
            majorTask: majorTask,
            preferentialTreatment: preferentialTreatment
        )
    }
}
