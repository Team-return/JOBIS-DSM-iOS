import Combine
import Foundation

public protocol RemoteFilesDataSource {
    func uploadFiles(data: [Data], fileName: String) -> AnyPublisher<[String], Error>
}
