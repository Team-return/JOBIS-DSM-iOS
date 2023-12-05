import Combine
import Foundation

public protocol FilesRepository {
    func uploadFiles(files: [UploadFilesRequestDTO]) -> AnyPublisher<[String], Error>
}
