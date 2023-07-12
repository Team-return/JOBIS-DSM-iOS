import Combine
import UsersDomainInterface

public protocol ReissueTokenUseCase {
    func execute() -> AnyPublisher<Bool, Error>
}
