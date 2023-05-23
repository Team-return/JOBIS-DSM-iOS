import RecruitmentsDomainInterface
import Combine

public struct FetchRecruitmentListUseCaseImpl: FetchRecruitmentListUseCase {
    private let recruitmentsRepository: any RecruitmentsRepository

    public init(recruitmentsRepository: any RecruitmentsRepository) {
        self.recruitmentsRepository = recruitmentsRepository
    }

    public func execute(page: Int, codeId: Int?, company: String?) -> AnyPublisher<RecruitmentListEntity, Error> {
        recruitmentsRepository.fetchRecruitmentList(page: page, codeId: codeId, company: company)
    }
}
