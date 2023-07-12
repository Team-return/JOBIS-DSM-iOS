import Combine
import BugsDomainInterface

public struct FetchBugDetailUseCaseImpl: FetchBugDetailUseCase {
    private let bugsRepository: any BugsRepository

    public init(bugsRepository: any BugsRepository) {
        self.bugsRepository = bugsRepository
    }

    public func execute(id: Int) -> AnyPublisher<BugDetailEntity, Error> {
        bugsRepository.fetchBugDetail(id: id)
    }
}
