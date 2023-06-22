import Combine
import Foundation

public protocol UploadFilesUseCase {
    func execute(data: [Data], fileName: String) -> AnyPublisher<[String], Error>
}
