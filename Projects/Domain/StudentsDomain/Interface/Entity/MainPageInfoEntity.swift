import Foundation

public struct MainPageInfoEntity: Equatable {
    public let studentName, studentGcn: String
    public let applyCompanies: [ApplyCompanyEntity]
    public let totalStudentCount, passCount, approvedCount: Int

    public init(
        studentName: String,
        studentGcn: String,
        applyCompanies: [ApplyCompanyEntity],
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
}

public struct ApplyCompanyEntity: Equatable, Hashable {
    public let companyName, status: String

    public init(companyName: String, status: String) {
        self.companyName = companyName
        self.status = status
    }
}
