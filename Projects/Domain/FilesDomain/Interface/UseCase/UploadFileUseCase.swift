import Combine
import Foundation

public protocol UploadFilesUseCase {
    func execute(files: [UploadFileModel]) -> AnyPublisher<[String], Error>
}
