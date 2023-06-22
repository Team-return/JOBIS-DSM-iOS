import StudentsDomainInterface
import Combine

public struct ChangePasswordUseCaseImpl: ChangePasswordUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error> {
        studentsRepository.changePassword(req: req)
    }
}
