import Foundation

public struct UploadFilesRequestDTO {
    public let data: Data
    public let name: String

    public init(data: Data, name: String) {
        self.data = data
        self.name = name
    }
}
