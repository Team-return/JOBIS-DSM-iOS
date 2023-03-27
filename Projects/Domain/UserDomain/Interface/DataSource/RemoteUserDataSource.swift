import Combine
import Foundation

public protocol RemoteUserDataSource {
    func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error>
    func reissueToken() -> AnyPublisher<Void, Error>
}
