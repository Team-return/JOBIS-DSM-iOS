import Combine
import Foundation

public protocol CodesRepository {
    func fetchCodes(keyword: String?, type: CodeType, parentCode: String?) -> AnyPublisher<CodeListEntity, Error>
}
