import Foundation

public struct SendAuthCodeRequestDTO: Encodable {
    public let email: String
    public let authCodeType: AuthCodeType
    public let userName: String

    public init(email: String, authCodeType: AuthCodeType, userName: String) {
        self.email = email
        self.authCodeType = authCodeType
        self.userName = userName
    }

    enum CodingKeys: String, CodingKey {
        case email
        case authCodeType = "auth_code_type"
        case userName = "user_name"
    }
}
