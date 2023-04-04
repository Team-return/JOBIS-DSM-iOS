import DesignSystem
import SwiftUI
import BaseFeature

struct SplashView: View {
    @StateObject var viewModel: SplashViewModel
    @EnvironmentObject var appState: AppState

    init(
        viewModel: SplashViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {}
        .onAppear {
            viewModel.onAppear {
                appState.sceneFlow = .main
            } onError: { _ in
                appState.sceneFlow = .auth
            }
        }
    }
}
