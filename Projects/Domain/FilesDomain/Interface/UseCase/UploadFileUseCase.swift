import Combine
import Foundation

public protocol UploadFilesUseCase {
    func execute(files: [UploadFilesRequestDTO]) -> AnyPublisher<[String], Error>
}
