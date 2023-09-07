import Foundation

public struct CompanyResponseDTO: Decodable {
    public let id: Int
    public let name: String
    public let logoURL: String
    public let take: Double

    public init(id: Int, name: String, logoURL: String, take: Double) {
        self.id = id
        self.name = name
        self.logoURL = logoURL
        self.take = take
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoURL = "logo_url"
        case take
    }
}
