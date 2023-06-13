import Combine

public protocol FetchRecruitmentListUseCase {
    func execute(page: Int, code: [String]?, name: String?) -> AnyPublisher<RecruitmentListEntity, Error>
}
