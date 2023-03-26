import Combine
import Foundation

public protocol CodeRepository {
    func fetchJobCode() -> AnyPublisher<JobCodeEntity, Error>
    func fetchTechCode(keyword: String) -> AnyPublisher<TechCodeEntity, Error>
}
