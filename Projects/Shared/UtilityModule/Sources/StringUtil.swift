import Foundation

public extension String {
    func formatAsGradeClassStudent() -> String {
        guard let number = Int(self) else {
            return "0000"
        }

        let grade = number / 1000
        let classNumber = (number % 1000) / 10
        let studentNumber = number % 100

        return "\(grade)학년 \(classNumber)반 \(studentNumber)번"
    }
}
