import StudentsDomainInterface
import Combine

public struct StudentExistsUseCaseImpl: StudentExistsUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(gcn: Int, name: String) -> AnyPublisher<Void, Error> {
        studentsRepository.studentExists(gcn: gcn, name: name)
    }
}
