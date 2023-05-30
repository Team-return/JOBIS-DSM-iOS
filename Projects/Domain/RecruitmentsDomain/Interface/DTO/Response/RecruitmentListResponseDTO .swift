import Foundation

public struct RecruitmentListResponseDTO: Codable {
    public let recruitments: [RecruitmentResponseDTO]

    public init(recruitments: [RecruitmentResponseDTO]) {
        self.recruitments = recruitments
    }
}
