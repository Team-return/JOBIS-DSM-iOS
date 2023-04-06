import Foundation

public struct SignupRequestDto: Encodable {
    public let email, password: String
    public let grade: Int
    public let name: String
    public let gender: GenderType
    public let classRoom, number: Int

    public init(
        email: String,
        password: String,
        grade: Int?,
        name: String,
        gender: GenderType?,
        classRoom: Int?,
        number: Int?
    ) {
        self.email = email
        self.password = password
        self.grade = grade ?? 0
        self.name = name
        self.gender = gender ?? .man
        self.classRoom = classRoom ?? 0
        self.number = number ?? 0
    }

    enum CodingKeys: String, CodingKey {
        case email
        case password, grade, name, gender
        case classRoom = "class_room"
        case number
    }
}
