import Moya
import AuthDomainInterface
import BaseDomain

public enum AuthAPI {
    case verifyAuthCode
    case sendAuthCode(SendAuthCodeRequestDTO)
}

extension AuthAPI: JobisAPI {
    public typealias ErrorType = AuthDomainError

    public var domain: JobisDomain {
        .auth
    }

    public var urlPath: String {
        switch self {
        case .sendAuthCode, .verifyAuthCode:
            return "/code"
        }
    }

    public var method: Method {
        switch self {
        case .sendAuthCode:
            return .post
        case .verifyAuthCode:
            return .patch
        }
    }

    public var task: Task {
        switch self {
        case let .sendAuthCode(req):
            return .requestJSONEncodable(req)
        case .verifyAuthCode:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .none
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .verifyAuthCode:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict
            ]
        case .sendAuthCode:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict
            ]
        }
    }
}
