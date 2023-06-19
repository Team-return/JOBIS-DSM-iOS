import Combine
import Foundation

public protocol RemoteFilesDataSource {
    func uploadFile(data: Data) -> AnyPublisher<[String], Error>
}
