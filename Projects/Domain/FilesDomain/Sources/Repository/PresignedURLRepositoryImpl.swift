import Combine
import Foundation
import FilesDomainInterface

public struct PresignedURLRepositoryImpl: PresignedURLRepository {
    private let remotePresignedURLDataSource: any RemotePresignedURLDataSource

    public init(remotePresignedURLDataSource: any RemotePresignedURLDataSource) {
        self.remotePresignedURLDataSource = remotePresignedURLDataSource
    }

    public func uploadImageToS3(presignedURL: String, data: Data) -> AnyPublisher<Void, Error> {
        remotePresignedURLDataSource.uploadImageToS3(presignedURL: presignedURL, data: data)
    }
}
