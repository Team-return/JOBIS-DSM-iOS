import Combine
import CodesDomainInterface

public struct FetchCodesUseCaseImpl: FetchCodesUseCase {
    private let codesRepository: any CodesRepository

    public init(codesRepository: any CodesRepository) {
        self.codesRepository = codesRepository
    }

    public func execute(keyword: String, type: CodeType) -> AnyPublisher<CodeEntity, Error> {
        codesRepository.fetchCodes(keyword: keyword, type: type)
    }
}
