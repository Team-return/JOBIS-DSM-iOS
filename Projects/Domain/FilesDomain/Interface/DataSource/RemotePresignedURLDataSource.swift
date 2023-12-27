import Combine
import Foundation

public protocol RemotePresignedURLDataSource {
    func uploadImageToS3(presignedURL: String, data: Data) -> AnyPublisher<Void, Error>
}
