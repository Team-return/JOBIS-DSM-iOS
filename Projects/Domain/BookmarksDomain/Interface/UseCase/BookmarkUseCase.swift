import Combine

public protocol BookmarkUseCase {
    func execute(id: Int) -> AnyPublisher<Void, Error>
}
