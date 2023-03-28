import Combine
import Foundation

public protocol UserRepository {
    func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error>
    func reissueToken() -> AnyPublisher<Void, Error>
}
