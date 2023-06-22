import Combine
import Foundation
import FilesDomainInterface

public struct FilesRepositoryImpl: FilesRepository {
    private let remoteFilesDataSource: any RemoteFilesDataSource

    public init(remoteFilesDataSource: any RemoteFilesDataSource) {
        self.remoteFilesDataSource = remoteFilesDataSource
    }

    public func uploadFiles(data: [Data], fileName: String) -> AnyPublisher<[String], Error> {
        remoteFilesDataSource.uploadFiles(data: data, fileName: fileName)
    }
}
