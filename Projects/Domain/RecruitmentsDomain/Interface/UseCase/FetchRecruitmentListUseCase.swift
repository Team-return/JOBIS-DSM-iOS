import Combine

public protocol FetchRecruitmentListUseCase {
    func execute(page: Int, codeId: Int?, name: String?) -> AnyPublisher<RecruitmentListEntity, Error>
}
