import Combine
import Foundation

public protocol FilesRepository {
    func uploadFile(data: Data) -> AnyPublisher<[String], Error>
}
