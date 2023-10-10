import Combine
import UsersDomainInterface

public protocol ReissueTokenUseCase {
    func execute() -> AnyPublisher<ReissueAuthorityEntity, Error>
}
