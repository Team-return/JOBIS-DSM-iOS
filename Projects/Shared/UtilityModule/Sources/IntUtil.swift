import Foundation

public extension Int {
    func intComma() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        return numberFormatter.string(from: NSNumber(value: self)) ?? "0"
    }
}
