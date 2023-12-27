import FilesDomainInterface
import Foundation
import BaseDomain
import Combine

public final class RemoteFilesDataSourceImpl: BaseRemoteDataSource<FilesAPI>, RemoteFilesDataSource {
    public func fetchPresignedURL(req: UploadFilesRequestDTO) -> AnyPublisher<[PresignedURLEntity], Error> {
        request(.fetchPresignedURL(req: req), dto: FetchPresignedURLResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
