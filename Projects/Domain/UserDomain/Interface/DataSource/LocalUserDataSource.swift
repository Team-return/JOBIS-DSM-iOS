import Combine
import Foundation

public protocol LocalUserDataSource {
    func loadJwtToken() -> JwtTokenEntity
}
