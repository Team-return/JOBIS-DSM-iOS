import Combine
import Foundation

public protocol AuthRepository {
    func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error>
    func loadJwtToken() -> JwtTokenEntity
}
