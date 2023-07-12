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
        ZStack {
            DesignSystemAsset.Image.splashLogo.swiftUIImage
                .resizable()
                .frame(width: 200, height: 200)
        }
        .onAppear {
            viewModel.onAppear { authority in
                appState.authority = authority
                appState.sceneFlow = .main
            } onError: { _ in
                appState.sceneFlow = .auth
            }
        }
    }
}
