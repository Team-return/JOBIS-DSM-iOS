import Combine
import Foundation

public protocol RemoteRecruitmentsDataSource {
    func fetchRecruitmentDetail(id: String) -> AnyPublisher<RecruitmentDetailEntity, Error>
    func fetchRecruitmentList(page: Int, codeId: Int?, name: String?) -> AnyPublisher<RecruitmentListEntity, Error>
}
