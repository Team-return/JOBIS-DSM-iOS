import Combine
import Foundation

public protocol RemoteStudentsDataSource {
    func signup(req: SignupRequestDto) -> AnyPublisher<Void, Error>
    func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error>
    func studentExists(gcn: Int, name: String) -> AnyPublisher<Void, Error>
}
