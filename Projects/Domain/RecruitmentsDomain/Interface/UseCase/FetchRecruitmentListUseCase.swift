import Combine

public protocol FetchRecruitmentListUseCase {
    func execute(page: Int, codeId: Int?, company: String?) -> AnyPublisher<RecruitmentListEntity, Error>
}
