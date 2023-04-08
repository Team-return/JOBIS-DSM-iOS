import Combine
import Foundation

public protocol RemoteUsersDataSource {
    func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error>
}
