import Combine
import CodeDomainInterface

public struct FetchTechCodeUseCaseImpl: FetchTechCodeUseCase {
    private let codeRepository: any CodeRepository

    public init(codeRepository: any CodeRepository) {
        self.codeRepository = codeRepository
    }

    public func execute(keyword: String) -> AnyPublisher<TechCodeEntity, Error> {
        codeRepository.fetchTechCode(keyword: keyword)
    }
}
