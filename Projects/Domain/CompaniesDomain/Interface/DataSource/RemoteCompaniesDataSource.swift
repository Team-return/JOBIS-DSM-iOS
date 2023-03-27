import Combine
import Foundation

public protocol RemoteCompaniesDataSource {
    func fetchStudentCompanyList() -> AnyPublisher<StudentCompanyEntity, Error>
    func fetchCompanyInfoDetail(id: String) -> AnyPublisher<CompanyInfoDetailEntity, Error>
}
