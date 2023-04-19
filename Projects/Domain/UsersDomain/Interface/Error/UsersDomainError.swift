import Foundation

public enum UsersDomainError: Error {
    // Sign in
    case notSpaceInput
    case notFoundPassword
    case notFound
    case internalServerError
}

extension UsersDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notSpaceInput:
            return "아이디 또는 비밀번호는 공백이 들어갈 수 없습니다."

        case .notFoundPassword:
            return "비밀번호를 확인해주세요."

        case .notFound:
            return "계정을 찾을 수 없습니다. 다시 한 번 확인해주세요."

        case .internalServerError:
            return "인터넷 환경을 확인해주세요."
        }
    }
}
