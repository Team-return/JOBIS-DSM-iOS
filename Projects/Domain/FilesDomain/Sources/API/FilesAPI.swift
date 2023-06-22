import FilesDomainInterface
import Foundation
import BaseDomain
import Moya

public enum FilesAPI {
    case uploadFile(data: [Data], fileName: String)
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
        case let .uploadFile(data, fileName):
            var multipartData: [MultipartFormData] {
                data.map {
                    MultipartFormData(
                        provider: .data($0),
                        name: "file",
                        fileName: fileName
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
        .none
    }

    public var errorMap: [Int: ErrorType] {
        return [
            400: .wrongFileForm,
            413: .fileSizeExceeded
        ]
    }
}
