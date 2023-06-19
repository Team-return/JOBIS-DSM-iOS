import Combine

public protocol FetchRecruitmentListUseCase {
    func execute(page: Int, jobCode: String?, techCode: [String]?, name: String?) -> AnyPublisher<RecruitmentListEntity, Error>
}
