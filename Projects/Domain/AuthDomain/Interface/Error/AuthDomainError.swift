import Foundation

public enum AuthDomainError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case conflict
    case internalServerError
}

extension AuthDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad Request"
        case .unauthorized:
            return "Unauthorized"
        case .forbidden:
            return "Forbidden"
        case .notFound:
            return "User Not Found"
        case .conflict:
            return "Conflict"
        case .internalServerError:
            return "Internal Server Error"
        }
    }
}
