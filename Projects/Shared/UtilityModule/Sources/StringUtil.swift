import Foundation

public extension String {
    func formatAsGradeClassStudent() -> String {
        guard self.count == 4 else {
            return "학번값이 이상해요"
        }

        let grade = self.prefix(1)
        let classroom = self.dropFirst().prefix(1)
        let number: String = String(Int(self.dropFirst(2)) ?? 0)

        return "\(grade)학년 \(classroom)반 \(number)번"
    }
}

public extension String {
    func intComma() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let value = Int(self) else { return nil }
        return numberFormatter.string(from: NSNumber(value: value))
    }
}
