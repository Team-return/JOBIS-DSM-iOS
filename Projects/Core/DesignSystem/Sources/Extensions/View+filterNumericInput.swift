import SwiftUI
import Combine

public extension View {
    func filterNumericInput(_ input: Binding<String>) -> some View {
        return self.onReceive(Just(input.wrappedValue)) { newValue in
            let filtered = newValue.filter { "0123456789".contains($0) }
            if filtered != newValue {
                input.wrappedValue = filtered
            }
        }
    }
}
