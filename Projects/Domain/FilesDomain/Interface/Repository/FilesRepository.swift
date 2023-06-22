import Combine
import Foundation

public protocol FilesRepository {
    func uploadFile(data: [Data], fileName: String) -> AnyPublisher<[String], Error>
}
