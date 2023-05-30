import Combine
import Foundation

public protocol RemoteCodesDataSource {
    func fetchCodes(keyword: String, type: CodeType) -> AnyPublisher<CodeListEntity, Error>
}
