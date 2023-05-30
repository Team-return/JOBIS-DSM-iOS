import Foundation

public struct AreaResponseDTO: Decodable {
    public let id: Int
    public let job: String
    public let tech: [String]
    public let hiring: Int
    public let majorTask: String

    public init(
        id: Int,
        job: String,
        tech: [String],
        hiring: Int,
        majorTask: String
    ) {
        self.id = id
        self.job = job
        self.tech = tech
        self.hiring = hiring
        self.majorTask = majorTask
    }

    enum CodingKeys: String, CodingKey {
        case id, job, tech, hiring
        case majorTask = "major_task"
    }
}
