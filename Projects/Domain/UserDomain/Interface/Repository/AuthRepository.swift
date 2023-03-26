import Combine
import Foundation

public protocol AuthRepository {
    func signin(req: SigninRequestDTO) -> AnyPublisher<Void, UserDomainError>
    func loadJwtToken() -> JwtTokenEntity
}
