import Combine
import Foundation

public protocol FilesRepository {
    func fetchPresignedURL(req: UploadFilesRequestDTO) -> AnyPublisher<[PresignedURLEntity], Error>
}
