import Foundation

public struct MarketingVersionResponseDTO: Decodable {
    public let results: [VersionResponseDTO]

    public init(results: [VersionResponseDTO]) {
        self.results = results
    }
}

public struct VersionResponseDTO: Decodable {
    public let version: String

    public init(version: String) {
        self.version = version
    }
}
