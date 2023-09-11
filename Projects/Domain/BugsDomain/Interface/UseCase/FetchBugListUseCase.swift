import Combine

public protocol FetchBugListUseCase {
    func execute(developmentType: DevelopmentType) -> AnyPublisher<BugListEntity, Error>
}
