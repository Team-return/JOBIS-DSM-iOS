import BaseFeature
import SwiftUI
import AuthFeature
import MainTabFeature
import SplashFeature

import DesignSystem

struct RootView: View {
    @EnvironmentObject var appState: AppState

    private let authComponent: AuthComponent
    private let mainTabComponent: MainTabComponent
    private let splashComponent: SplashComponent

    public init(
        authComponent: AuthComponent,
        mainTabComponent: MainTabComponent,
        splashComponent: SplashComponent
    ) {
        self.authComponent = authComponent
        self.mainTabComponent = mainTabComponent
        self.splashComponent = splashComponent
    }

    var body: some View {
        ZStack {
            switch appState.sceneFlow {
            case .auth:
                authComponent.makeView()
                    .environmentObject(appState)

            case .main:
                mainTabComponent.makeView()
                    .environmentObject(appState)

            case .splash:
                splashComponent.makeView()
                    .environmentObject(appState)
            }
        }
        .animation(.easeInOut, value: appState.sceneFlow)
        .transition(.opacity.animation(.easeInOut))
    }
}
