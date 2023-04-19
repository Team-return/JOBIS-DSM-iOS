import DesignSystem
import SwiftUI
import BaseFeature

struct SignupView: View {
    private enum FocusField {
        case email
        case authCode
        case password
        case checkPassword
        case name
    }
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SignupViewModel
    @FocusState private var focusField: FocusField?

    init(
        viewModel: SignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        EmptyView()
    }
}
