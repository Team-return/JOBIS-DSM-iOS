import StudentsDomainInterface
import BaseDomain
import Combine

public final class RemoteStudentsDataSourceImpl: BaseRemoteDataSource<StudentsAPI>, RemoteStudentsDataSource {
    public func signup(req: SignupRequestDto) -> AnyPublisher<Void, Error> {
        request(.signup(req))
    }

    public func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error> {
        request(.renewalPassword(req))
    }

    public func studentExists(gcn: Int, name: String) -> AnyPublisher<Void, Error> {
        request(.studentExists(gcn: gcn, name: name))
    }

    public func fetchStudentInfo() -> AnyPublisher<StudentInfoEntity, Error> {
        request(.fetchStudentInfo, dto: StudentInfoResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
