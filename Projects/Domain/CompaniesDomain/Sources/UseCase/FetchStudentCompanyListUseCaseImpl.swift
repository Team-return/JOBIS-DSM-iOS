import CompaniesDomainInterface
import Combine

public struct FetchStudentCompanyListUseCaseImpl: FetchStudentCompanyListUseCase {
    private let companiesRepository: any CompaniesRepository

    public init(companiesRepository: any CompaniesRepository) {
        self.companiesRepository = companiesRepository
    }

    public func execute() -> AnyPublisher<StudentCompanyEntity, Error> {
        companiesRepository.fetchStudentCompanyList()
    }
}
