import Combine

public protocol ReportBugsUseCase {
    func execute(req: ReportBugsRequestDTO) -> AnyPublisher<Void, Error>
}
