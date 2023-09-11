import Combine

public protocol FetchBugDetailUseCase {
    func execute(id: Int) -> AnyPublisher<BugDetailEntity, Error>
}
