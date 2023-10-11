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
        .alert(isPresented: $viewModel.showUpdateAlert) {
            if viewModel.forceAlert {
                return Alert(
                    title: Text("업데이트 알림"),
                    message: Text(viewModel.alertMessage),
                    dismissButton: Alert.Button.destructive(
                        Text("업데이트하러 가기"),
                        action: {
                            viewModel.openAppStore()
                        }
                    )
                )
            } else {
                let reissue: () -> Void = {
                    viewModel.compareRefreshToke { authority in
                        appState.authority = authority
                        appState.sceneFlow = .main
                    } onError: { _ in
                        appState.sceneFlow = .auth
                    }
                }

                return Alert(
                    title: Text("업데이트 알림"),
                    message: Text(viewModel.alertMessage),
                    primaryButton: Alert.Button.destructive(
                        Text("업데이트하러 가기"),
                        action: {
                            viewModel.openAppStore()
                            reissue()
                        }
                    ),
                    secondaryButton: Alert.Button.cancel(
                        Text("그냥 사용할래요"),
                        action: reissue
                    )
                )
            }
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
