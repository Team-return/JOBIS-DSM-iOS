import Combine
import Foundation

public protocol RemoteAuthDataSource {
    func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
    func reissueToken() -> AnyPublisher<Bool, Error>
    func verifyAuthCode(email: String, authCode: String) -> AnyPublisher<Void, Error>
}
