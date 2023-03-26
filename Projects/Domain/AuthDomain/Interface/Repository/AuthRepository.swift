import Combine
import Foundation

public protocol AuthRepository {
    func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, AuthDomainError>
}
