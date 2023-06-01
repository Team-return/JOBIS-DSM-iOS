import Combine
import Foundation

public protocol RemoteCodesDataSource {
    func fetchCodes(keyword: String?, type: CodeType, parentCode: String?) -> AnyPublisher<CodeListEntity, Error>
}
