import Combine
import Foundation

public protocol RemoteFilesDataSource {
    func uploadFile(data: [Data], fileName: String) -> AnyPublisher<[String], Error>
}
