import Foundation

public enum FilesDomainError: Error {
    case wrongFileForm
    case fileSizeExceeded
    case askDeveloper
}

extension FilesDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .wrongFileForm:
            return "파일 형식이 잘못 됐습니다."

        case .fileSizeExceeded:
            return "파일 용량을 줄여주세요.(최대 100MB)"

        case .askDeveloper:
            return "개발자에게 문의해주세요."
        }
    }
}
