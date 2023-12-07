import Moya
import BugsDomainInterface
import BaseDomain

public enum BugsAPI {
    case reportBugs(ReportBugsRequestDTO)
    case fetchBugList(DevelopmentType)
    case fetchBugDetail(id: Int)
}

extension BugsAPI: JobisAPI {
    public typealias ErrorType = BugsDomainError

    public var domain: JobisDomain {
        return .bugs
    }

    public var urlPath: String {
        switch self {
        case .reportBugs, .fetchBugList:
            return ""

        case let .fetchBugDetail(id):
            return "/\(id)/"
        }
    }

    public var method: Method {
        switch self {
        case .reportBugs:
            return .post

        case .fetchBugList, .fetchBugDetail:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .reportBugs(let req):
            return .requestJSONEncodable(req)

        case let .fetchBugList(developmentType):
            return .requestParameters(
                parameters: [
                    "development_area": developmentType.rawValue
                ],
                encoding: URLEncoding.queryString)

        case .fetchBugDetail:
            return .requestPlain
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
