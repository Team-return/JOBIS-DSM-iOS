import CompaniesDomainInterface
import Combine

public struct FetchWritableReviewListUseCaseImpl: FetchWritableReviewListUseCase {
    private let companiesRepository: any CompaniesRepository

    public init(companiesRepository: any CompaniesRepository) {
        self.companiesRepository = companiesRepository
    }

    public func execute() -> AnyPublisher<WritableReviewListEntity, Error> {
        companiesRepository.fetchWritableReviewList()
    }
}
