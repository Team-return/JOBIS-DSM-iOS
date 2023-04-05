import Combine
import Foundation

public protocol LocalUsersDataSource {
    func loadJwtToken() -> JwtTokenEntity
}
