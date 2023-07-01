import Moya
import ReviewsDomainInterface
import BaseDomain

public enum ReviewsAPI {
    case fetchReviewDetail(id: String)
    case fetchReviewList(id: String)
    case postReview(PostReviewRequestDTO)
}

extension ReviewsAPI: JobisAPI {
    public typealias ErrorType = ReviewsDomainError

    public var domain: JobisDomain {
        .reviews
    }

    public var urlPath: String {
        switch self {
        case let .fetchReviewDetail(id):
            return "/detail/\(id)"

        case let .fetchReviewList(id):
            return "/\(id)"

        case .postReview:
            return "/"
        }
    }

    public var method: Method {
        switch self {
        case .fetchReviewList, .fetchReviewDetail:
            return .get

        case .postReview:
            return .post
        }
    }

    public var task: Task {
        switch self {
        case let .postReview(req):
            return .requestJSONEncodable(req)
        default:
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
            return [:]
        }
    }
}
