import Foundation

public struct RecruitmentListEntity: Equatable, Hashable {
    public var recruitments: [RecruitmentEntity]

    public init(recruitments: [RecruitmentEntity]) {
        self.recruitments = recruitments
    }
}
