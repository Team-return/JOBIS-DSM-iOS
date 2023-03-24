import SwiftUI

struct JOBISSelectionTabbKey: EnvironmentKey {
    static var defaultValue: Binding<TabFlow> = .constant(.home)
}

public extension EnvironmentValues {
    var jobisSelectionTabbKey: Binding<TabFlow> {
        get { self[JOBISSelectionTabbKey.self] }
        set { self[JOBISSelectionTabbKey.self] = newValue }
    }
}
