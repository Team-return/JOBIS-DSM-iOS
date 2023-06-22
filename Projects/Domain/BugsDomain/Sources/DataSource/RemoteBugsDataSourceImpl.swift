import BugsDomainInterface
import BaseDomain
import Combine

public final class RemoteBugsDataSourceImpl: BaseRemoteDataSource<BugsAPI>,
                                         RemoteBugsDataSource {
    public func reportBugs(req: ReportBugsRequestDTO) -> AnyPublisher<Void, Error> {
        request(.reportBugs(req))
    }
}
