import BugsDomainInterface
import Combine

public struct BugsRepositoryImpl: BugsRepository {
    private let remoteBugsDataSource: any RemoteBugsDataSource

    public init(
        remoteBugsDataSource: any RemoteBugsDataSource
    ) {
        self.remoteBugsDataSource = remoteBugsDataSource
    }

    public func reportBugs(req: ReportBugsRequestDTO) -> AnyPublisher<Void, Error> {
        remoteBugsDataSource.reportBugs(req: req)
    }

    public func fetchBugList(developmentType: DevelopmentType) -> AnyPublisher<BugListEntity, Error> {
        remoteBugsDataSource.fetchBugList(developmentType: developmentType)
    }

    public func fetchBugDetail(id: Int) -> AnyPublisher<BugDetailEntity, Error> {
        remoteBugsDataSource.fetchBugDetail(id: id)
    }
}
