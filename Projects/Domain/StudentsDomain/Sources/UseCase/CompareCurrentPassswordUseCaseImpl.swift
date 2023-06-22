import StudentsDomainInterface
import Combine

public struct CompareCurrentPassswordUseCaseImpl: CompareCurrentPassswordUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(password: String) -> AnyPublisher<Void, Error> {
        studentsRepository.compareCurrentPasssword(password: password)
    }
}
