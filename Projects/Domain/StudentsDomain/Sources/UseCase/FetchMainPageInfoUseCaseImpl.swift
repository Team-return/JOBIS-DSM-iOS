import StudentsDomainInterface
import Combine

public struct FetchMainPageInfoUseCaseImpl: FetchMainPageInfoUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute() -> AnyPublisher<MainPageInfoEntity, Error> {
        studentsRepository.fetchMainPageInfo()
    }
}
