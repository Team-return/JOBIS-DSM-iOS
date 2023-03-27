import Foundation

public enum UserDomainError: Error {
    case badRequest
    case unauthorized
    case internalServerError
    case notFound
}

extension UserDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad Request"
        case .unauthorized:
            return "Unauthorized"
        case .internalServerError:
            return "Internal Server Error"
        case .notFound:
            return "User Not Found"
        }
    }
}
