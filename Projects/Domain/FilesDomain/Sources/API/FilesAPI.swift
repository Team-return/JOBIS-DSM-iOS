import FilesDomainInterface
import Foundation
import BaseDomain
import Moya

public enum FilesAPI {
    case uploadFile(data: [Data])
}

extension FilesAPI: JobisAPI {
    public typealias ErrorType = FilesDomainError

    public var domain: JobisDomain {
        .files
    }

    public var urlPath: String {
        return ""
    }

    public var method: Moya.Method {
        return .post
    }

    public var task: Moya.Task {
        switch self {
        case let .uploadFile(data):
            var multipartData: [MultipartFormData] {
                data.map {
                    MultipartFormData(
                        provider: .data($0),
                        name: "file",
                        fileName: "\($0)"
                    )
                }
            }

            return .uploadCompositeMultipart(
                multipartData,
                urlParameters: ["type": "EXTENSION_FILE"]
            )
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        return [
            400: .wrongFileForm,
            413: .fileSizeExceeded
        ]
    }
}
