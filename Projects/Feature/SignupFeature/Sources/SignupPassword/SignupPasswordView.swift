import DesignSystem
import SwiftUI
import BaseFeature

struct SignupPasswordView: View {
    private enum FocusField {
        case password
        case checkPassword
    }
    @StateObject var viewModel: SignupPasswordViewModel
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: SignupPasswordViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        EmptyView()
    }
}
