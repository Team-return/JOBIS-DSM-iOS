import CodeDomainInterface
import Combine

public struct FetchJobCodeUseCaseImpl: FetchJobCodeUseCase {
    private let codeRepository: any CodeRepository

    public init(codeRepository: any CodeRepository) {
        self.codeRepository = codeRepository
    }

    public func execute() -> AnyPublisher<JobCodeEntity, Error> {
        codeRepository.fetchJobCode()
    }
}
