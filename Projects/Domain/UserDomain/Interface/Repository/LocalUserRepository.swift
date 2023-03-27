import Combine
import Foundation

public protocol LocalUserRepository {
    func loadJwtToken() -> JwtTokenEntity
}
