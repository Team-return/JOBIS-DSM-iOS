import Combine
import Foundation

public protocol PresignedURLRepository {
    func uploadImageToS3(presignedURL: String, data: Data) -> AnyPublisher<Void, Error>
}
