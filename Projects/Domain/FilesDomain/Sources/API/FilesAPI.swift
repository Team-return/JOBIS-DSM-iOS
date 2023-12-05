import FilesDomainInterface
import Foundation
import BaseDomain
import Moya

public enum FilesAPI {
    case uploadFiles(files: [UploadFilesRequestDTO])
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
        case let .uploadFiles(files):
            var multipartData: [MultipartFormData] {
                files.map { file in
                    MultipartFormData(
                        provider: .data(file.data),
                        name: "file",
                        fileName: file.name
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
            413: .fileSizeExceeded,
            500: .askDeveloper
        ]
    }
}
