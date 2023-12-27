import FilesDomainInterface
import Foundation
import BaseDomain
import Moya

public enum FilesAPI {
    case fetchPresignedURL(req: UploadFilesRequestDTO)
}

extension FilesAPI: JobisAPI {
    public typealias ErrorType = FilesDomainError

    public var domain: JobisDomain {
        .files
    }

    public var urlPath: String {
        return "/pre-signed"
    }

    public var method: Moya.Method {
        return .post
    }

    public var task: Moya.Task {
        switch self {
        case let .fetchPresignedURL(req):
            return .requestJSONEncodable(req)
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        return [
            400: .wrongFileForm,
            413: .fileSizeExceeded,
            500: .askDeveloper
        ]
    }
}
