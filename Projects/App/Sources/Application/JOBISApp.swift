import SwiftUI
import BaseFeature
import JwtStoreInterface
import JwtStore
import NeedleFoundation
import Inject

@main
struct JOBISApp: App {
    @ObservedObject private var iOput = Inject.observer
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var appState = AppState(sceneFlow: .splash)

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
                .enableInjection()
        }
    }
}
