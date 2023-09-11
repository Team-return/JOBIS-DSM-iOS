import Combine

public protocol BugsRepository {
    func reportBugs(req: ReportBugsRequestDTO) -> AnyPublisher<Void, Error>
    func fetchBugList(developmentType: DevelopmentType) -> AnyPublisher<BugListEntity, Error>
    func fetchBugDetail(id: Int) -> AnyPublisher<BugDetailEntity, Error>
}
