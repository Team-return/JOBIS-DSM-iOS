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
}
