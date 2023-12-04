import Combine

public protocol ReApplyCompanyUseCase {
    func execute(id: String, req: ApplyCompanyRequestDTO) -> AnyPublisher<Void, Error>
}
