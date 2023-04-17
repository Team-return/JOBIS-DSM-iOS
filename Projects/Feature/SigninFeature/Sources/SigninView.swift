import DesignSystem
import SwiftUI
import BaseFeature

struct SigninView: View {
    private enum FocusField {
        case id
        case password
    }
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SigninViewModel
    @FocusState private var focusField: FocusField?

    init(
        viewModel: SigninViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        EmptyView()
    }
}
