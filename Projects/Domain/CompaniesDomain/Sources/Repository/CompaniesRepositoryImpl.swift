import CompaniesDomainInterface
import Combine

struct CompaniesRepositoryImpl: CompaniesRepository {
    private let remoteCompaniesDataSource: any RemoteCompaniesDataSource

    init(
        remoteCompaniesDataSource: any RemoteCompaniesDataSource
    ) {
        self.remoteCompaniesDataSource = remoteCompaniesDataSource
    }

    func fetchStudentCompanyList() -> AnyPublisher<StudentCompanyEntity, Error> {
        remoteCompaniesDataSource.fetchStudentCompanyList()
    }

    func fetchCompanyInfoDetail(id: String) -> AnyPublisher<CompanyInfoDetailEntity, Error> {
        remoteCompaniesDataSource.fetchCompanyInfoDetail(id: id)
    }
}
