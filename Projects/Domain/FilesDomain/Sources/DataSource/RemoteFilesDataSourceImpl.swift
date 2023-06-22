import FilesDomainInterface
import Foundation
import BaseDomain
import Combine

public final class RemoteFilesDataSourceImpl: BaseRemoteDataSource<FilesAPI>, RemoteFilesDataSource {
    public func uploadFile(data: [Data], fileName: String) -> AnyPublisher<[String], Error> {
        request(.uploadFile(data: data, fileName: fileName), dto: UploadFileResponseDTO.self)
            .map(\.urls)
            .eraseToAnyPublisher()
    }
}
