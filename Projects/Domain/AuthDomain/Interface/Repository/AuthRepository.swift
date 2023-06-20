import Combine
import Foundation

public protocol AuthRepository {
    func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
    func reissueToken() -> AnyPublisher<Void, Error>
    func verifyAuthCode(email: String, authCode: String) -> AnyPublisher<Void, Error>
    func logout()
}
