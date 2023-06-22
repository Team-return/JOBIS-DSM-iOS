import FilesDomainInterface
import Foundation
import BaseDomain
import Combine

public final class RemoteFilesDataSourceImpl: BaseRemoteDataSource<FilesAPI>, RemoteFilesDataSource {
    public func uploadFiles(data: [Data], fileName: String) -> AnyPublisher<[String], Error> {
        request(.uploadFiles(data: data, fileName: fileName), dto: UploadFilesResponseDTO.self)
            .map(\.urls)
            .eraseToAnyPublisher()
    }
}
