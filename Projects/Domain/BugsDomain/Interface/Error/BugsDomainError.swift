import Foundation

public enum BugsDomainError: Error {
    case isSpace
}

extension BugsDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .isSpace:
            return "공백이 있을 수 없습니다."
        }
    }
}
