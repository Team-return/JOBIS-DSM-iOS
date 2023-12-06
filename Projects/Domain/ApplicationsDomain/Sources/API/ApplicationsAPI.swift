import Moya
import ApplicationsDomainInterface
import BaseDomain

public enum ApplicationsAPI {
    case applyCompany(id: String, ApplyCompanyRequestDTO)
    case cancelApply(id: String)
    case fetchApplication
    case fetchTotalPassStudent
    case fetchRejectionReason(id: String)
    case reApplyCompany(id: String, ApplyCompanyRequestDTO)
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

        case .fetchTotalPassStudent:
            return "/employment/count"

        case let .fetchRejectionReason(id):
            return "/rejection/\(id)"

        case let .reApplyCompany(id, _):
            return "/\(id)"
        }
    }

    public var method: Method {
        switch self {
        case .applyCompany:
            return .post

        case .cancelApply:
            return .delete

        case .fetchApplication, .fetchTotalPassStudent, .fetchRejectionReason:
            return .get

        case .reApplyCompany:
            return .put
        }
    }

    public var task: Task {
        switch self {
        case let .applyCompany(_, req):
            return .requestJSONEncodable(req)

        case let .reApplyCompany(_, req):
            return .requestJSONEncodable(req)

        case .cancelApply, .fetchApplication, .fetchTotalPassStudent, .fetchRejectionReason:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchApplication, .applyCompany, .fetchRejectionReason, .reApplyCompany:
            return .accessToken
        default:
            return .none
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .applyCompany:
            return [
                400: .isSpace,
                401: .noThirdGrade,
                403: .forbidden,
                404: .notFoundRecruitment,
                409: .alreadyApply,
                500: .askDeveloper
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

        case .fetchTotalPassStudent:
            return [:]

        case .fetchRejectionReason:
            return [:]

        case .reApplyCompany:
            return [
                400: .isSpace,
                401: .noThirdGrade,
                403: .forbidden,
                404: .notFoundRecruitment,
                409: .alreadyApply,
                500: .askDeveloper
            ]
        }
    }
}
