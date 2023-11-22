import Combine
import Foundation

public protocol UsersRepository {
    func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error>
    func fetchMarketingVersion() -> AnyPublisher<String, Error>
}
