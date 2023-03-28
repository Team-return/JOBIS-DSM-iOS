import RecruitmentsDomainInterface
import BaseDomain
import Combine

public final class RemoteRecruitmentsDataSourceImpl: BaseRemoteDataSource<RecruitmentsAPI>,
                                             RemoteRecruitmentsDataSource {
    public func fetchRecruitmentDetail(id: String) -> AnyPublisher<RecruitmentDetailEntity, Error> {
        request(.fetchRecruitmentDetail(id: id), dto: RecruitmentDetailResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchRecruitmentList(page: Int) -> AnyPublisher<RecruitmentListEntity, Error> {
        request(.fetchRecruitmentList(page: page), dto: RecruitmentListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
