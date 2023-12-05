import Combine
import Foundation

public protocol RemoteFilesDataSource {
    func uploadFiles(files: [UploadFilesRequestDTO]) -> AnyPublisher<[String], Error>
}
