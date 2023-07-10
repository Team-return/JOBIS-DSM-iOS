import Moya
import BugsDomainInterface
import BaseDomain

public enum BugsAPI {
    case reportBugs(ReportBugsRequestDTO)
}

extension BugsAPI: JobisAPI {
    public typealias ErrorType = BugsDomainError

    public var domain: JobisDomain {
        return .bugs
    }

    public var urlPath: String {
        switch self {
        case .reportBugs:
            return ""
        }
    }

    public var method: Method {
        switch self {
        case .reportBugs:
            return .post
        }
    }

    public var task: Task {
        switch self {
        case .reportBugs(let req):
            return .requestJSONEncodable(req)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .accessToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        default:
            return [
                400: .isSpace
            ]
        }
    }
}
