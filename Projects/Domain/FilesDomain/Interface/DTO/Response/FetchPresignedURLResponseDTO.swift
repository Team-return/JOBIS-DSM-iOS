import Foundation

public struct FetchPresignedURLResponseDTO: Decodable {
    public let urls: [URLsResponseDTO]
}

public struct URLsResponseDTO: Decodable {
    public let filePath: String
    public let preSignedUrl: String

    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
        case preSignedUrl = "pre_signed_url"
    }
}

public extension FetchPresignedURLResponseDTO {
    func toDomain() -> [PresignedURLEntity] {
        self.urls.map {
            .init(filePath: $0.filePath, preSignedUrl: $0.preSignedUrl)
        }
    }
}
