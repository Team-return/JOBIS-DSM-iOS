import Combine
import Foundation

public protocol RemoteBugsDataSource {
    func reportBugs(req: ReportBugsRequestDTO) -> AnyPublisher<Void, Error>
    func fetchBugList(developmentType: DevelopmentType) -> AnyPublisher<BugListEntity, Error>
    func fetchBugDetail(id: Int) -> AnyPublisher<BugDetailEntity, Error>
}
