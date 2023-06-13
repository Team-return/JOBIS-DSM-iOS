import CodesDomainInterface
import Combine

public struct CodesRepositoryImpl: CodesRepository {
    private let remoteCodesDataSource: any RemoteCodesDataSource

    public init(
        remoteCodesDataSource: any RemoteCodesDataSource
    ) {
        self.remoteCodesDataSource = remoteCodesDataSource
    }

    public func fetchCodes(
        keyword: String?, type: CodeType, parentCode: String?
    ) -> AnyPublisher<CodeListEntity, Error> {
        remoteCodesDataSource.fetchCodes(keyword: keyword, type: type, parentCode: parentCode)
    }
}
