import Combine

public protocol BugsRepository {
    func reportBugs(req: ReportBugsRequestDTO) -> AnyPublisher<Void, Error>
}
