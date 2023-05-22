import Foundation

public struct MainPageInfoResponseDTO: Decodable {
    let studentName, studentGcn: String
    let applyCompanies: [ApplyCompanyResponseDTO]
    let totalStudentCount, passCount, approvedCount: Int

    public init(
        studentName: String,
        studentGcn: String,
        applyCompanies: [ApplyCompanyResponseDTO],
        totalStudentCount: Int,
        passCount: Int,
        approvedCount: Int
    ) {
        self.studentName = studentName
        self.studentGcn = studentGcn
        self.applyCompanies = applyCompanies
        self.totalStudentCount = totalStudentCount
        self.passCount = passCount
        self.approvedCount = approvedCount
    }

    enum CodingKeys: String, CodingKey {
        case studentName = "student_name"
        case studentGcn = "student_gcn"
        case applyCompanies = "apply_companies"
        case totalStudentCount = "total_student_count"
        case passCount = "pass_count"
        case approvedCount = "approved_count"
    }
}

public struct ApplyCompanyResponseDTO: Decodable {
    let companyName, status: String

    public init(companyName: String, status: String) {
        self.companyName = companyName
        self.status = status
    }

    enum CodingKeys: String, CodingKey {
        case companyName = "company_name"
        case status
    }
}

public extension MainPageInfoResponseDTO {
    func toDomain() -> MainPageInfoEntity {
        MainPageInfoEntity(
            studentName: studentName,
            studentGcn: studentGcn,
            applyCompanies: applyCompanies.map { $0.toDomain() },
            totalStudentCount: totalStudentCount,
            passCount: passCount,
            approvedCount: approvedCount
        )
    }
}

public extension ApplyCompanyResponseDTO {
    func toDomain() -> ApplyCompanyEntity {
        ApplyCompanyEntity(companyName: companyName, status: status)
    }
}
