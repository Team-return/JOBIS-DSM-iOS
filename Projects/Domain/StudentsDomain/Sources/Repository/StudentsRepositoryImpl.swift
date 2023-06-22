import StudentsDomainInterface
import Combine

public struct StudentsRepositoryImpl: StudentsRepository {
    private let remoteStudentsDataSource: any RemoteStudentsDataSource

    public init(remoteStudentsDataSource: any RemoteStudentsDataSource) {
        self.remoteStudentsDataSource = remoteStudentsDataSource
    }

    public func signup(req: SignupRequestDto) -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.signup(req: req)
    }

    public func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.renewalPassword(req: req)
    }

    public func studentExists(gcn: Int, name: String) -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.studentExists(gcn: gcn, name: name)
    }

    public func fetchStudentInfo() -> AnyPublisher<StudentInfoEntity, Error> {
        remoteStudentsDataSource.fetchStudentInfo()
    }

    public func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.changePassword(req: req)
    }

    public func compareCurrentPasssword(password: String) -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.compareCurrentPasssword(password: password)
    }
}
