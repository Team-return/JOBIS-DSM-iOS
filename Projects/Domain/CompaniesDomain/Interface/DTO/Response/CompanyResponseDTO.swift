import Foundation

public struct CompanyResponseDTO: Decodable {
    public let id: Int
    public let name: String
    public let logoURL: String
    public let take: Double
    public let hasRecruitment: Bool

    public init(id: Int, name: String, logoURL: String, take: Double, hasRecruitment: Bool) {
        self.id = id
        self.name = name
        self.logoURL = logoURL
        self.take = take
        self.hasRecruitment = hasRecruitment
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoURL = "logo_url"
        case take
        case hasRecruitment = "has_recruitment"
    }
}
