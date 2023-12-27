import FilesDomainInterface
import Foundation
import BaseDomain
import Combine

public final class RemotePresignedURLDataSourceImpl: BaseRemoteDataSource<PresignedURLAPI>,
                                                     RemotePresignedURLDataSource {
    public func uploadImageToS3(presignedURL: String, data: Data) -> AnyPublisher<Void, Error> {
        request(.uploadImageToS3(presignedURL: presignedURL, data: data))
    }
}
