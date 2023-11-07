import Combine
import Foundation

public protocol RemoteUsersDataSource {
    func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error>
    func fetchMarketingVersion() -> AnyPublisher<String, Error>
}
