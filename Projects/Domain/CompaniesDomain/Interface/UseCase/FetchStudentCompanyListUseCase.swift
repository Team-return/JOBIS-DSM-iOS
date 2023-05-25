import Combine

public protocol FetchStudentCompanyListUseCase {
    func execute(page: Int, name: String?) -> AnyPublisher<StudentCompanyListEntity, Error>
}
