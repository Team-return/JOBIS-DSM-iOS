import CodeDomainInterface
import Combine

public struct CodeRepositoryImpl: CodeRepository {
    private let remoteCodeDataSource: any RemoteCodeDataSource

    public init(
        remoteCodeDataSource: any RemoteCodeDataSource
    ) {
        self.remoteCodeDataSource = remoteCodeDataSource
    }

    public func fetchJobCode() -> AnyPublisher<JobCodeEntity, Error> {
        remoteCodeDataSource.fetchJobCode()
    }

    public func fetchTechCode(keyword: String) -> AnyPublisher<TechCodeEntity, Error> {
        remoteCodeDataSource.fetchTechCode(keyword: keyword)
    }
}
