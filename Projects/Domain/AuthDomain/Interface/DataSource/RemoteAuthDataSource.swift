import Combine
import Foundation

public protocol RemoteAuthDataSource {
    func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
    func reissueToken() -> AnyPublisher<Void, Error>
}
