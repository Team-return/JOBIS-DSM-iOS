import Foundation

public struct SignupRequestDto: Encodable {
    public let email, phoneNumber, password: String
    public let grade: Int
    public let name: String
    public let gender: GenderType
    public let classRoom, number: Int

    enum CodingKeys: String, CodingKey {
        case email
        case phoneNumber = "phone_number"
        case password, grade, name, gender
        case classRoom = "class_room"
        case number
    }
}
