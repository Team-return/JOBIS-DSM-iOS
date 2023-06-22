import Foundation
import Combine
import FilesDomainInterface

public struct UploadFilesUseCaseImpl: UploadFilesUseCase {
    private let filesRepository: any FilesRepository

    public init(filesRepository: any FilesRepository) {
        self.filesRepository = filesRepository
    }

    public func execute(data: [Data], fileName: String) -> AnyPublisher<[String], Error> {
        filesRepository.uploadFiles(data: data, fileName: fileName)
    }
}
