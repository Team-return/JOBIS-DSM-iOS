import CompaniesDomainInterface
import BaseDomain
import Combine

public final class RemoteCompaniesDataSourceImpl: BaseRemoteDataSource<CompaniesAPI>, RemoteCompaniesDataSource {
    public func fetchStudentCompanyList(page: Int, name: String?) -> AnyPublisher<StudentCompanyListEntity, Error> {
        request(.fetchStudentCompanyList(page: page, name: name), dto: StudentCompanyResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchCompanyInfoDetail(id: String) -> AnyPublisher<CompanyInfoDetailEntity, Error> {
        request(.fetchCompanyInfoDetail(id: id), dto: CompanyInfoDetailResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchWritableReviewList() -> AnyPublisher<WritableReviewListEntity, Error> {
        request(.fetchWritableReviewList, dto: WritableReviewListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
