import Combine
import Foundation

public protocol RemoteCodeDataSource {
    func fetchJobCode() -> AnyPublisher<JobCodeEntity, Error>
    func fetchTechCode(keyword: String) -> AnyPublisher<TechCodeEntity, Error>
}
