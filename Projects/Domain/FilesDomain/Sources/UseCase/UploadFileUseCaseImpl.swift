import Foundation
import Combine
import FilesDomainInterface

public struct UploadFilesUseCaseImpl: UploadFilesUseCase {
    private let filesRepository: any FilesRepository
    private let presignedURLRepository: any PresignedURLRepository

    public init(
        filesRepository: any FilesRepository,
        presignedURLRepository: any PresignedURLRepository
    ) {
        self.filesRepository = filesRepository
        self.presignedURLRepository = presignedURLRepository
    }

    public func execute(files: [UploadFileModel]) -> AnyPublisher<[String], Error> {
        var bag = Set<AnyCancellable>()
        return filesRepository.fetchPresignedURL(
            req: .init(
                files: files.toRequestDTO()
            )
        )
        .map { presignedURLs in
            zip(presignedURLs, files).map { url, file in
                print(url.preSignedUrl, file.fileName)
                presignedURLRepository.uploadImageToS3(presignedURL: url.preSignedUrl, data: file.file)
                    .sink { _ in } receiveValue: { _ in }
                    .store(in: &bag)

                return url.filePath
            }
        }
        .eraseToAnyPublisher()
    }
}
