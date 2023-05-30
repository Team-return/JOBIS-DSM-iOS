import Combine
import Foundation

public protocol CodesRepository {
    func fetchCodes(keyword: String, type: CodeType) -> AnyPublisher<CodeListEntity, Error>
}
