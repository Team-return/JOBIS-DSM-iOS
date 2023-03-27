import Combine

public protocol FetchRecruitmentDetailUseCase {
    func execute(id: String) -> AnyPublisher<RecruitmentDetailEntity, Error>
}
