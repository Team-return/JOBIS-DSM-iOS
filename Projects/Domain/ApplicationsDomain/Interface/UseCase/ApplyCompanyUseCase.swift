import Combine

public protocol ApplyCompanyUseCase {
    func execute(id: String, req: ApplyCompanyRequestDTO) -> AnyPublisher<Void, Error>
}
