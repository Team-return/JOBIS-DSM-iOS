import Combine

public protocol FetchCodesUseCase {
    func execute(keyword: String, type: CodeType) -> AnyPublisher<CodeListEntity, Error>
}
