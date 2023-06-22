import Combine
import BugsDomainInterface

public struct ReportBugsUseCaseImpl: ReportBugsUseCase {
    private let bugsRepository: any BugsRepository

    public init(bugsRepository: any BugsRepository) {
        self.bugsRepository = bugsRepository
    }

    public func execute(req: ReportBugsRequestDTO) -> AnyPublisher<Void, Error> {
        bugsRepository.reportBugs(req: req)
    }
}
