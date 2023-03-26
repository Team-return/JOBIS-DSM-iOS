import CodeDomainInterface
import Combine

struct CodeRepositoryImpl: CodeRepository {
    private let remoteCodeDataSource: any RemoteCodeDataSource

    init(
        remoteCodeDataSource: any RemoteCodeDataSource
    ) {
        self.remoteCodeDataSource = remoteCodeDataSource
    }

    public func fetchJobCode() -> AnyPublisher<CodeDomainInterface.JobCodeEntity, Error> {
        remoteCodeDataSource.fetchJobCode()
    }

    public func fetchTechCode(keyword: String) -> AnyPublisher<CodeDomainInterface.TechCodeEntity, Error> {
        remoteCodeDataSource.fetchTechCode(keyword: keyword)
    }
}
