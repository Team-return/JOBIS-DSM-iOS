import Foundation

public struct StudentInfoResponseDTO: Decodable {
    public let studentName: String
    public let studentGcn: String
    public let department: DepartmentType

    public init(studentName: String, studentGcn: String, department: DepartmentType) {
        self.studentName = studentName
        self.studentGcn = studentGcn
        self.department = department
    }

    enum CodingKeys: String, CodingKey {
        case studentName = "student_name"
        case studentGcn = "student_gcn"
        case department
    }
}
