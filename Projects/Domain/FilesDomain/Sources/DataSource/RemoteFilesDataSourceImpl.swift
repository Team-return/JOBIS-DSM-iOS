import FilesDomainInterface
import Foundation
import BaseDomain
import Combine

public final class RemoteFilesDataSourceImpl: BaseRemoteDataSource<FilesAPI>, RemoteFilesDataSource {
    public func uploadFiles(files: [UploadFilesRequestDTO]) -> AnyPublisher<[String], Error> {
        request(.uploadFiles(files: files), dto: UploadFilesResponseDTO.self)
            .map(\.urls)
            .eraseToAnyPublisher()
    }
}
