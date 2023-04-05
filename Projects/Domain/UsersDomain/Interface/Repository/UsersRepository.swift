import Combine
import Foundation

public protocol UsersRepository {
    func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error>
    func reissueToken() -> AnyPublisher<Void, Error>
}
