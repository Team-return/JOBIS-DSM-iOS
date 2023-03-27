import Combine
import Foundation

public protocol StudentsRepository {
    func signup(req: SignupRequestDto) -> AnyPublisher<Void, Error>
    func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error>
}
