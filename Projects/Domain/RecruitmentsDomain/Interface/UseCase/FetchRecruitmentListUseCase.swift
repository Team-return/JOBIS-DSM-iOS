import Combine

public protocol FetchRecruitmentListUseCase {
    func execute(page: Int) -> AnyPublisher<RecruitmentListEntity, Error>
}
