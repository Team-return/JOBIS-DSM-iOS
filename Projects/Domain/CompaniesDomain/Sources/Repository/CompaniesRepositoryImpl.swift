import CompaniesDomainInterface
import Combine

public struct CompaniesRepositoryImpl: CompaniesRepository {
    private let remoteCompaniesDataSource: any RemoteCompaniesDataSource

    public init(
        remoteCompaniesDataSource: any RemoteCompaniesDataSource
    ) {
        self.remoteCompaniesDataSource = remoteCompaniesDataSource
    }

    public func fetchStudentCompanyList() -> AnyPublisher<StudentCompanyEntity, Error> {
        remoteCompaniesDataSource.fetchStudentCompanyList()
    }

    public func fetchCompanyInfoDetail(id: String) -> AnyPublisher<CompanyInfoDetailEntity, Error> {
        remoteCompaniesDataSource.fetchCompanyInfoDetail(id: id)
    }
}
