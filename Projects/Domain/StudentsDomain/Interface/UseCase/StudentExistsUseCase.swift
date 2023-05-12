import Combine

public protocol StudentExistsUseCase {
    func execute(gcn: Int, name: String) -> AnyPublisher<Void, Error>
}
