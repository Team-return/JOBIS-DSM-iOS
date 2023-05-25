import CompaniesDomainInterface
import Combine

public struct FetchStudentCompanyListUseCaseImpl: FetchStudentCompanyListUseCase {
    private let companiesRepository: any CompaniesRepository

    public init(companiesRepository: any CompaniesRepository) {
        self.companiesRepository = companiesRepository
    }

    public func execute(page: Int, name: String?) -> AnyPublisher<StudentCompanyListEntity, Error> {
        companiesRepository.fetchStudentCompanyList(page: page, name: name)
    }
}
