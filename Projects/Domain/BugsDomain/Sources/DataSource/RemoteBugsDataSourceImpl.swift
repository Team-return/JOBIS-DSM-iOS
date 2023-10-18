import BugsDomainInterface
import BaseDomain
import Combine

public final class RemoteBugsDataSourceImpl: BaseRemoteDataSource<BugsAPI>, RemoteBugsDataSource {
    public func reportBugs(req: ReportBugsRequestDTO) -> AnyPublisher<Void, Error> {
        request(.reportBugs(req))
    }

    public func fetchBugList(developmentType: DevelopmentType) -> AnyPublisher<BugListEntity, Error> {
        request(.fetchBugList(developmentType), dto: BugListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchBugDetail(id: Int) -> AnyPublisher<BugDetailEntity, Error> {
        request(.fetchBugDetail(id: id), dto: BugDetailResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
