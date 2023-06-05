import Combine

public protocol FetchRecruitmentListUseCase {
    func execute(
        page: Int, code: String?, companyName: String?
    ) -> AnyPublisher<RecruitmentListEntity, Error>
}
