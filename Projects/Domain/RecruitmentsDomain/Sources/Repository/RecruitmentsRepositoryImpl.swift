import RecruitmentsDomainInterface
import Combine

struct RecruitmentsRepositoryImpl: RecruitmentsRepository {
    private let remoteRecruitmentsDataSource: any RemoteRecruitmentsDataSource

    public init(remoteRecruitmentsDataSource: any RemoteRecruitmentsDataSource) {
        self.remoteRecruitmentsDataSource = remoteRecruitmentsDataSource
    }

    public func fetchRecruitmentDetail(id: String) -> AnyPublisher<RecruitmentDetailEntity, Error> {
        remoteRecruitmentsDataSource.fetchRecruitmentDetail(id: id)
    }

    func fetchRecruitmentList(page: Int) -> AnyPublisher<RecruitmentListEntity, Error> {
        remoteRecruitmentsDataSource.fetchRecruitmentList(page: page)
    }
}
