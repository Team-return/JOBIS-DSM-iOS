import RecruitmentsDomainInterface
import Combine

public struct RecruitmentsRepositoryImpl: RecruitmentsRepository {
    private let remoteRecruitmentsDataSource: any RemoteRecruitmentsDataSource

    public init(remoteRecruitmentsDataSource: any RemoteRecruitmentsDataSource) {
        self.remoteRecruitmentsDataSource = remoteRecruitmentsDataSource
    }

    public func fetchRecruitmentDetail(id: String) -> AnyPublisher<RecruitmentDetailEntity, Error> {
        remoteRecruitmentsDataSource.fetchRecruitmentDetail(id: id)
    }

    public func fetchRecruitmentList(
        page: Int, codeId: Int?, name: String?
    ) -> AnyPublisher<RecruitmentListEntity, Error> {
        remoteRecruitmentsDataSource.fetchRecruitmentList(page: page, codeId: codeId, name: name)
    }
}
