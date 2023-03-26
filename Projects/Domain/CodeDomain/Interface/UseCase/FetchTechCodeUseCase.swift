import Combine

public protocol FetchTechCodeUseCase {
    func execute(keyword: String) -> AnyPublisher<TechCodeEntity, Error>
}
