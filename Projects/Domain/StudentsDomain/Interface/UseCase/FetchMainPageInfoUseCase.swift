import Combine

public protocol FetchMainPageInfoUseCase {
    func execute() -> AnyPublisher<MainPageInfoEntity, Error>
}
