import Combine
import Foundation

public protocol RemoteUsersDataSource {
    func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error>
    func reissueToken() -> AnyPublisher<Void, Error>
}
