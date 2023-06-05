import RecruitmentsDomainInterface
import BaseDomain
import Combine

public final class RemoteRecruitmentsDataSourceImpl:
    BaseRemoteDataSource<RecruitmentsAPI>, RemoteRecruitmentsDataSource {
    public func fetchRecruitmentDetail(id: String) -> AnyPublisher<RecruitmentDetailEntity, Error> {
        request(.fetchRecruitmentDetail(id: id), dto: RecruitmentDetailResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchRecruitmentList(
        page: Int, code: String?, companyName: String?
    ) -> AnyPublisher<RecruitmentListEntity, Error> {
        request(
            .fetchRecruitmentList(page: page, code: code, companyName: companyName),
            dto: RecruitmentListResponseDTO.self
        )
        .map { $0.toDomain() }
        .eraseToAnyPublisher()
    }
}
