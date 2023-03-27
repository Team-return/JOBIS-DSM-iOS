import RecruitmentsDomainInterface
import Combine

public struct FetchRecruitmentDetailUseCaseImpl: FetchRecruitmentDetailUseCase {
    private let recruitmentsRepository: any RecruitmentsRepository

    public init(recruitmentsRepository: any RecruitmentsRepository) {
        self.recruitmentsRepository = recruitmentsRepository
    }

    public func execute(id: String) -> AnyPublisher<RecruitmentDetailEntity, Error> {
        recruitmentsRepository.fetchRecruitmentDetail(id: id)
    }
}
