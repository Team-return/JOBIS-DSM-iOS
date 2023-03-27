import CompaniesDomainInterface
import Combine

public struct FetchCompanyInfoDetailUseCaseImpl: FetchCompanyInfoDetailUseCase {
    private let companiesRepository: any CompaniesRepository

    public init(companiesRepository: any CompaniesRepository) {
        self.companiesRepository = companiesRepository
    }

    public func execute(id: String) -> AnyPublisher<CompanyInfoDetailEntity, Error> {
        companiesRepository.fetchCompanyInfoDetail(id: id)
    }
}
