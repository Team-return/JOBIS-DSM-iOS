import Combine
import Foundation

public protocol RemoteFilesDataSource {
    func fetchPresignedURL(req: UploadFilesRequestDTO) -> AnyPublisher<[PresignedURLEntity], Error>
}
