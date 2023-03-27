import CompaniesDomainInterface
import BaseDomain
import Combine

public final class RemoteCompaniesDataSourceImpl: BaseRemoteDataSource<CompaniesAPI>, RemoteCompaniesDataSource {
    public func fetchStudentCompanyList() -> AnyPublisher<StudentCompanyEntity, Error> {
        request(.fetchStudentCompanyList, dto: StudentCompanyResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchCompanyInfoDetail(id: String) -> AnyPublisher<CompanyInfoDetailEntity, Error> {
        request(.fetchCompanyInfoDetail(id: id), dto: CompanyInfoDetailResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
