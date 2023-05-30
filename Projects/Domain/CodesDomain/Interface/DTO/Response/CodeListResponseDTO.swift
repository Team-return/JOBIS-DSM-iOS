import Foundation

public struct CodeListResponseDTO: Decodable {
    public let codes: [CodeResponseDTO]

    public init(codes: [CodeResponseDTO]) {
        self.codes = codes
    }
}
