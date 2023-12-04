import Combine
import Foundation

public protocol RemoteApplicationsDataSource {
    func applyCompany(id: String, req: ApplyCompanyRequestDTO) -> AnyPublisher<Void, Error>
    func reApplyCompany(id: String, req: ApplyCompanyRequestDTO) -> AnyPublisher<Void, Error>
    func cancelApply(id: String) -> AnyPublisher<Void, Error>
    func fetchApplication() -> AnyPublisher<ApplicationListEntity, Error>
    func fetchTotalPassStudent() -> AnyPublisher<TotalPassStudentEntity, Error>
    func fetchRejectionReason(id: String) -> AnyPublisher<String, Error>
}
