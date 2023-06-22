import Combine
import Foundation

public protocol StudentsRepository {
    func signup(req: SignupRequestDto) -> AnyPublisher<Void, Error>
    func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error>
    func studentExists(gcn: Int, name: String) -> AnyPublisher<Void, Error>
    func fetchStudentInfo() -> AnyPublisher<StudentInfoEntity, Error>
    func compareCurrentPasssword(password: String) -> AnyPublisher<Void, Error>
    func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error>
}
