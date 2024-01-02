import Moya
import AuthDomainInterface
import BaseDomain

public enum AuthAPI {
    case verifyAuthCode(email: String, authCode: String)
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

        case let .verifyAuthCode(email, authCode):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "auth_code": authCode
                ], encoding: URLEncoding.queryString
            )

        case .reissueToken:
            return .requestParameters(parameters: [
                "platform-type": "IOS"
            ], encoding: URLEncoding.queryString)
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
                401: .wrongAuthCode,
                404: .notFoundAuthCode
            ]

        case .sendAuthCode:
            return [
                400: .wrongEmailForm,
                404: .userNotFound,
                409: .existUser
            ]

        case .reissueToken:
            return [
                404: .notFoundToken,
                500: .internalServerError
            ]
        }
    }
}
