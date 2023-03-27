import Combine

public protocol FetchCompanyInfoDetailUseCase {
    func execute(id: String) -> AnyPublisher<CompanyInfoDetailEntity, Error>
}
