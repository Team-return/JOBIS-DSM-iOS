import Combine

public protocol FetchStudentInfoUseCase {
    func execute() -> AnyPublisher<StudentInfoEntity, Error>
}
