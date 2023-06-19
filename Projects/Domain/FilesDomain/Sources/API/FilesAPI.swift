import FilesDomainInterface
import Foundation
import BaseDomain
import Moya

public enum FilesAPI {
    case uploadFile(data: Data)
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
            let formData = MultipartFormData(provider: .data(data), name: "file", fileName: "\(UUID().uuidString).png")
            let multipartData = [formData]

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
        [:]
    }
}
