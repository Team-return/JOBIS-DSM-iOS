import Combine
import Foundation

public protocol LocalUsersRepository {
    func loadJwtToken() -> JwtTokenEntity
}
