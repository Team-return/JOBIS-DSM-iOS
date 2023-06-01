import Combine

public protocol FetchCodesUseCase {
    func execute(keyword: String?, type: CodeType, parentCode: String?) -> AnyPublisher<CodeListEntity, Error>
}
