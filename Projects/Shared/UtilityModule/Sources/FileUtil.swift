import Foundation

public extension URL {
    func getFileSize() -> String {
        do {
            let attributes = try FileManager.default.attributesOfItem(atPath: self.path)
            if let fileSize = attributes[.size] as? Int64 {
                let fileSizeInKB = Double(fileSize) / 1024.0
                return String(format: "%.1f", fileSizeInKB) + "KB"
            }
        } catch {
            print("Error: \(error)")
        }
        return "사이즈를 알 수 없어요"
    }
}
