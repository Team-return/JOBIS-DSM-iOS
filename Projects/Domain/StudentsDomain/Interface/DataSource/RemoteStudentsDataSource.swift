import Combine
import Foundation

public protocol RemoteStudentsDataSource {
    func signup(req: SignupRequestDTO) -> AnyPublisher<Void, Error>
    func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error>
    func studentExists(gcn: Int, name: String) -> AnyPublisher<Void, Error>
    func fetchStudentInfo() -> AnyPublisher<StudentInfoEntity, Error>
    func compareCurrentPasssword(password: String) -> AnyPublisher<Void, Error>
    func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error>
    func changeProfileImage(url: String) -> AnyPublisher<Void, Error>
}
