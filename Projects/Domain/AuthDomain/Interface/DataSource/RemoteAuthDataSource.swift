import Combine
import Foundation
import BaseDomain

public protocol RemoteAuthDataSource {
    func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, AuthDomainError>
}
