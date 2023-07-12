import Combine
import BugsDomainInterface

public struct FetchBugListUseCaseImpl: FetchBugListUseCase {
    private let bugsRepository: any BugsRepository

    public init(bugsRepository: any BugsRepository) {
        self.bugsRepository = bugsRepository
    }

    public func execute(developmentType: DevelopmentType) -> AnyPublisher<BugListEntity, Error> {
        bugsRepository.fetchBugList(developmentType: developmentType)
    }
}
