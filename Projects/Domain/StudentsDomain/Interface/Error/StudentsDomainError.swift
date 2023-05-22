import Foundation

public enum StudentsDomainError: Error {
    // Sign up
    case alreadyExistsAccount

    // Find PW
    case badRequest
    case unauthorized
    case notFound
    case conflict

    // Student Exists
    case notExistsStudent

    // Fetch Main Page Information
    case wrongToken
}

extension StudentsDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .alreadyExistsAccount:
            return "이미 존재하는 계정입니다."

        case .badRequest:
            return "Bad Request"

        case .unauthorized:
            return "Unauthorized"

        case .notFound:
            return "User Not Found"

        case .conflict:
            return "Conflict"

        case .notExistsStudent:
            return "존재하지 않은 학생입니다."

        case .wrongToken:
            print("토큰 만료")
            return "토큰 만료"
        }
    }
}
