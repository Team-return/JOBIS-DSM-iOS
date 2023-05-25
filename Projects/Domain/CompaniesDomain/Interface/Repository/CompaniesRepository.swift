import Combine
import Foundation

public protocol CompaniesRepository {
    func fetchStudentCompanyList(page: Int, name: String?) -> AnyPublisher<StudentCompanyListEntity, Error>
    func fetchCompanyInfoDetail(id: String) -> AnyPublisher<CompanyInfoDetailEntity, Error>
}
