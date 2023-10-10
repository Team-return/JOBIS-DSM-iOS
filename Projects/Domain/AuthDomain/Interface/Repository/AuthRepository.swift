import Combine
import Foundation

public protocol AuthRepository {
    func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
    func reissueToken() -> AnyPublisher<ReissueAuthorityEntity, Error>
    func verifyAuthCode(email: String, authCode: String) -> AnyPublisher<Void, Error>
    func logout()
}
