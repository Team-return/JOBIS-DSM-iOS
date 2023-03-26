import Combine
import BaseDomain

public protocol SendAuthCodeUseCase {
    func execute(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, AuthDomainError>
}
