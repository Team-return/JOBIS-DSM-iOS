import StudentsDomainInterface
import Combine

public struct SignupUseCaseImpl: SignupUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(req: SignupRequestDto) -> AnyPublisher<Void, Error> {
        studentsRepository.signup(req: req)
    }
}
