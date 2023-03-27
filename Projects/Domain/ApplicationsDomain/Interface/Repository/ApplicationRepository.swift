import Combine
import Foundation

public protocol ApplicationsRepository {
    func applyCompany(id: String, req: ApplyCompanyRequestDTO) -> AnyPublisher<Void, Error>
    func cancelApply(id: String) -> AnyPublisher<Void, Error>
    func fetchApplication() -> AnyPublisher<[ApplicationEntity], Error>
}
