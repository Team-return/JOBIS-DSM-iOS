import Combine
import Foundation

public protocol RecruitmentsRepository {
    func fetchRecruitmentDetail(id: String) -> AnyPublisher<RecruitmentDetailEntity, Error>
    func fetchRecruitmentList(page: Int) -> AnyPublisher<RecruitmentListEntity, Error>
}
