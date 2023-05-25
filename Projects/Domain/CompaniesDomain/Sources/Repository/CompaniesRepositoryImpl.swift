import CompaniesDomainInterface
import Combine

public struct CompaniesRepositoryImpl: CompaniesRepository {
    private let remoteCompaniesDataSource: any RemoteCompaniesDataSource

    public init(
        remoteCompaniesDataSource: any RemoteCompaniesDataSource
    ) {
        self.remoteCompaniesDataSource = remoteCompaniesDataSource
    }

    public func fetchStudentCompanyList(page: Int, name: String?) -> AnyPublisher<StudentCompanyListEntity, Error> {
        remoteCompaniesDataSource.fetchStudentCompanyList(page: page, name: name)
    }

    public func fetchCompanyInfoDetail(id: String) -> AnyPublisher<CompanyInfoDetailEntity, Error> {
        remoteCompaniesDataSource.fetchCompanyInfoDetail(id: id)
    }
}
