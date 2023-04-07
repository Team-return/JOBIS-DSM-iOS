import Moya
import AuthDomainInterface
import BaseDomain

public enum AuthAPI {
    case verifyAuthCode
    case sendAuthCode(SendAuthCodeRequestDTO)
    case reissueToken
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
        case .reissueToken:
            return "/reissue"
        }
    }

    public var method: Method {
        switch self {
        case .sendAuthCode:
            return .post
        case .verifyAuthCode:
            return .patch
        case .reissueToken:
            return .put
        }
    }

    public var task: Task {
        switch self {
        case let .sendAuthCode(req):
            return .requestJSONEncodable(req)
        case .verifyAuthCode, .reissueToken:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .reissueToken:
            return .refreshToken
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
        case .reissueToken:
            return [
                404: .notFound,
                500: .internalServerError
            ]
        }
    }
}
