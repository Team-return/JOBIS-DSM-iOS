import StudentsDomainInterface
import Combine

struct StudentsRepositoryImpl: StudentsRepository {
    private let remoteStudentsDataSource: any RemoteStudentsDataSource

    init(remoteStudentsDataSource: any RemoteStudentsDataSource) {
        self.remoteStudentsDataSource = remoteStudentsDataSource
    }

    func signup(req: SignupRequestDto) -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.signup(req: req)
    }
    
    func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.renewalPassword(req: req)
    }
}
