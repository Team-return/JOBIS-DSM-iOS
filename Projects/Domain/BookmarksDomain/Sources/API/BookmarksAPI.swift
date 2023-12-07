import Moya
import BookmarksDomainInterface
import BaseDomain

public enum BookmarksAPI {
    case fetchBookmarkList
    case bookmark(id: Int)
}

extension BookmarksAPI: JobisAPI {
    public typealias ErrorType = BookmarksError

    public var domain: JobisDomain {
        return .bookmarks
    }

    public var urlPath: String {
        switch self {
        case .fetchBookmarkList:
            return ""

        case let .bookmark(id):
            return "/\(id)"
        }
    }

    public var method: Method {
        switch self {
        case .fetchBookmarkList:
            return .get

        case .bookmark:
            return .patch
        }
    }

    public var task: Task {
        switch self {
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
