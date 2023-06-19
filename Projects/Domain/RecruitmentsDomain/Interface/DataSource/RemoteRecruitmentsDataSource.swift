import Combine
import Foundation

public protocol RemoteRecruitmentsDataSource {
    func fetchRecruitmentDetail(id: String) -> AnyPublisher<RecruitmentDetailEntity, Error>
    func fetchRecruitmentList(
        page: Int, jobCode: String?, techCode: [String]?, name: String?
    ) -> AnyPublisher<RecruitmentListEntity, Error>
}
