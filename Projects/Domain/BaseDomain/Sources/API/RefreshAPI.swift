import Emdpoint

enum RefreshEndpoint {
    case refresh
}

extension RefreshEndpoint: JobisEndpoint {
    typealias ErrorType = RefreshError

    var route: Route {
        .patch("/auth")
    }

    var task: HTTPTask {
        .requestPlain
    }

    var jwtTokenType: JwtTokenType {
        .refreshToken
    }

    var errorMapper: [Int: ErrorType]? {
        [
            400: .invalidToken,
            401: .expiredToken,
            500: .unknown
        ]
    }
}
