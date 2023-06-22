import Foundation

public extension URL {
    func getFileSize() -> String {
        do {
            let attributes = try FileManager.default.attributesOfItem(atPath: self.path)
            if let fileSize = attributes[.size] as? Double {
                let fileSizeInKB = Double(fileSize) / 1024.0
                if fileSizeInKB >= 1024 {
                    let fileSizeInMB = fileSizeInKB / 1024.0
                    return String(format: "%.1fMB", fileSizeInMB)
                } else {
                    return String(format: "%.1fKB", fileSizeInKB)
                }
            }
        } catch {
            print("Error: \(error)")
        }
        return "사이즈를 알 수 없어요"
    }
}
