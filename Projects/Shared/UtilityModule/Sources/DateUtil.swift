import Foundation

public extension String {
    func toJOBISDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.date(from: self) ?? .init()
    }
}

public extension Date {
    func toDotsString() -> String {
        let lastFormatter = DateFormatter()
        lastFormatter.dateFormat = "yyyy.MM.dd"
        lastFormatter.locale = Locale(identifier: "ko_kr")
        return lastFormatter.string(from: self)
    }
}
