import Combine
import Foundation

public protocol CompaniesRepository {
    func fetchStudentCompanyList() -> AnyPublisher<StudentCompanyEntity, Error>
    func fetchCompanyInfoDetail(id: String) -> AnyPublisher<CompanyInfoDetailEntity, Error>
}
