import UsersDomainInterface
import Foundation
import BaseDomain
import Combine
import Moya

public final class RemoteUsersDataSourceImpl: BaseRemoteDataSource<UsersAPI>, RemoteUsersDataSource {
    public func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error> {
        request(.signin(req), dto: AuthorityResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchMarketingVersion() -> AnyPublisher<String, Error> {
        let provider: MoyaProvider<VersionAPI>
        #if DEV || STAGE
        provider = MoyaProvider(plugins: [MoyaLogginPlugin()])
        #else
        provider = MoyaProvider(plugins: [])
        #endif

        let requestPublisher = provider.requestPublisher(.fetchMarketingVersion)
            .map(\.data)
            .decode(type: MarketingVersionResponseDTO.self, decoder: JSONDecoder())
            .mapError { $0 as Error }
            .map { $0.results.first?.version ?? ""}
            .eraseToAnyPublisher()

        _ = requestPublisher.sink { _ in } receiveValue: { _ in }

        return requestPublisher
    }
}
