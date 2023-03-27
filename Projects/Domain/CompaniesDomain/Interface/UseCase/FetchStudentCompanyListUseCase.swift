import Combine

public protocol FetchStudentCompanyListUseCase {
    func execute() -> AnyPublisher<StudentCompanyEntity, Error>
}
