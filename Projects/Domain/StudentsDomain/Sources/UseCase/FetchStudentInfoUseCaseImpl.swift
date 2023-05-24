import StudentsDomainInterface
import Combine

public struct FetchStudentInfoUseCaseImpl: FetchStudentInfoUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute() -> AnyPublisher<StudentInfoEntity, Error> {
        studentsRepository.fetchStudentInfo()
    }
}
