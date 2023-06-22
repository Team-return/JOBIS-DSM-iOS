import Combine
import Foundation

public protocol FilesRepository {
    func uploadFiles(data: [Data], fileName: String) -> AnyPublisher<[String], Error>
}
