import Combine
import Foundation

public protocol RemoteBugsDataSource {
    func reportBugs(req: ReportBugsRequestDTO) -> AnyPublisher<Void, Error>
}
