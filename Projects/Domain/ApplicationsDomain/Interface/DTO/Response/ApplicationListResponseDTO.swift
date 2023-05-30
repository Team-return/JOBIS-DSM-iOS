import Foundation

public struct ApplicationListResponseDTO: Decodable {
    public let applications: [ApplicationResponseDTO]

    public init(applications: [ApplicationResponseDTO]) {
        self.applications = applications
    }
}
