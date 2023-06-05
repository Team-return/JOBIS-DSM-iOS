import Combine
import Foundation

public protocol RemoteRecruitmentsDataSource {
    func fetchRecruitmentDetail(id: String) -> AnyPublisher<RecruitmentDetailEntity, Error>
    func fetchRecruitmentList(
        page: Int, code: String?, companyName: String?
    ) -> AnyPublisher<RecruitmentListEntity, Error>
}
