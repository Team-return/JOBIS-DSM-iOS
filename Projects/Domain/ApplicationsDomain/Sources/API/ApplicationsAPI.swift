import Moya
import ApplicationsDomainInterface
import BaseDomain

public enum ApplicationsAPI {
    case applyCompany(id: String, ApplyCompanyRequestDTO)
    case cancelApply(id: String)
    case fetchApplication
}

extension ApplicationsAPI: JobisAPI {
    public typealias ErrorType = ApplicationsDomainError

    public var domain: JobisDomain {
        .applications
    }

    public var urlPath: String {
        switch self {
        case let .applyCompany(id, _):
            return "/\(id)"
        case let .cancelApply(id):
            return "/\(id)"
        case .fetchApplication:
            return "/students"
        }
    }

    public var method: Method {
        switch self {
        case .applyCompany:
            return .post
        case .cancelApply:
            return .delete
        case .fetchApplication:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case let .applyCompany(_, req):
            return .requestJSONEncodable(req)
        case .cancelApply, .fetchApplication:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .applyCompany:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                409: .conflict
            ]
        case .cancelApply:
            return [
                400: .badRequest,
                401: .unauthorized,
                409: .conflict
            ]
        case .fetchApplication:
            return [
                401: .unauthorized,
                403: .forbidden
            ]
        }
    }
}
