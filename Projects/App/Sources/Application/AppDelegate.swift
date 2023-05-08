import Foundation
import DesignSystem
import JwtStoreInterface
import UIKit
import WatchConnectivity

final class AppDelegate: UIResponder, UIApplicationDelegate {
    var session: WCSession!
    var keychain: (any Keychain)?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        self.session = .default
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }

        DesignSystemFontFamily.registerAllCustomFonts()
        return true
    }
}

extension AppDelegate: WCSessionDelegate {
    func sessionDidBecomeInactive(_ session: WCSession) { }

    func sessionDidDeactivate(_ session: WCSession) { }

    func session(
        _ session: WCSession,
        didReceiveMessage message: [String: Any],
        replyHandler: @escaping ([String: Any]) -> Void
    ) {
        guard let keychain else {
            return
        }

        let message: [String: Any] = [
            "accessToken": keychain.load(type: .accessToken),
            "accessExpiredAt": keychain.load(type: .accessExpiresAt)
        ]
        replyHandler(message)
    }

    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
        guard let keychain else {
            return
        }

        let message: [String: Any] = [
            "accessToken": keychain.load(type: .accessToken),
            "accessExpiredAt": keychain.load(type: .accessExpiresAt)
        ]
        sendMessage(message: message) { _ in } error: { error in
            print(error.localizedDescription)
        }
    }
}

private extension AppDelegate {
    func sendMessage(
        message: [String: Any],
        reply: @escaping ([String: Any]) -> Void,
        error: ((Error) -> Void)? = nil
    ) {
        guard session.activationState == .activated else {
            return
        }
        session.sendMessage(message, replyHandler: reply, errorHandler: error)
    }
}
