import SwiftUI
import BaseFeature
import JwtStoreInterface
import JwtStore
import NeedleFoundation

@main
struct JOBISApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var appState = AppState(sceneFlow: .splash, authority: .student)

    private let keychain: any Keychain

    init() {
        registerProviderFactories()
        self.keychain = KeychainImpl()
        appDelegate.keychain = keychain
    }

    var body: some Scene {
        WindowGroup {
            AppComponent(keychain: keychain).makeRootView()
                .preferredColorScheme(.light)
                .environmentObject(appState)
        }
    }
}
