import Foundation

public enum CodeDomainError: Error {
    case badRequest
}

extension CodeDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad Request"
        }
    }
}
