import BaseFeature
import UIKit
import Combine
import AuthDomainInterface
import UsersDomainInterface

final class SplashViewModel: BaseViewModel {
    private let reissueTokenUseCase: any ReissueTokenUseCase
    private let fetchMarketVersionUseCase: any FetchMarketVersionUseCase

    @Published var showUpdateAlert: Bool = false
    @Published var forceAlert: Bool = false
    public var alertMessage = ""

    public init(
        reissueTokenUseCase: any ReissueTokenUseCase,
        fetchMarketVersionUseCase: any FetchMarketVersionUseCase
    ) {
        self.reissueTokenUseCase = reissueTokenUseCase
        self.fetchMarketVersionUseCase = fetchMarketVersionUseCase
    }

    func onAppear(
        onSuccess: @escaping (AuthorityType) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        print("!")
        fetchMarketingVersion {
            self.compareRefreshToke(onSuccess: onSuccess, onError: onError)
        }
    }

    func compareRefreshToke(
        onSuccess: @escaping (AuthorityType) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        addCancellable(reissueTokenUseCase.execute()) { authority in
            if authority.authority == .developer || authority.authority == .student {
                onSuccess(AuthorityType(rawValue: authority.authority.rawValue) ?? .student)
            } else {
                onError(AuthDomainError.internalServerError)
            }
        } onReceiveError: { error in
            onError(error)
        }
    }

    private func fetchMarketingVersion(action: @escaping () -> Void) {
        print("response")
        addCancellable(fetchMarketVersionUseCase.execute()) { [weak self] version in
            print("version:", version)
            self?.update(marketingVersion: version, action: action)
        }
    }

    private func update(marketingVersion: String, action: @escaping () -> Void) {
        print("update 검사")
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
              appVersion != "0.0.0",
              let intAppVersion = appVersion.intAndRemoveDot(),
              let intMarketingVersion = marketingVersion.intAndRemoveDot(),
              intAppVersion < intMarketingVersion else { return action() }
        print("T.T", intAppVersion, intMarketingVersion)
        showAlert(
            appVersionArray: appVersion.split(separator: ".").map { $0 },
            marketingVersionArray: marketingVersion.split(separator: ".").map { $0 },
            action: action
        )
    }

    private func showAlert(
        appVersionArray appVersion: [String.SubSequence],
        marketingVersionArray marketingVersion: [String.SubSequence],
        action: @escaping () -> Void
    ) {
        let mVersion = marketingVersion.joined(separator: ".")
        let aVersion = appVersion.joined(separator: ".")
        DispatchQueue.main.async {
            if appVersion[0] < marketingVersion[0] {
                self.alertMessage = "JOBIS의 새로운 버전이 있습니다.\n\(mVersion) 버전으로 업데이트 해주세요.\n(현재: \(aVersion))"
                self.showUpdateAlert.toggle()
                self.forceAlert.toggle()
            } else if appVersion[1] < marketingVersion[1] {
                self.alertMessage = "새로운 기능이 추가되었어요\n\(mVersion) 버전으로 업데이트 해주세요.\n(현재: \(aVersion))"
                self.showUpdateAlert.toggle()
            } else if  appVersion[2] < marketingVersion[2] {
                self.alertMessage = "\(mVersion) 버전으로 업데이트를 권장합니다.\n버그가 고쳐졌을 수도 있어요.\n(현재: \(aVersion))"
                self.showUpdateAlert.toggle()
            } else {
                action()
            }
        }
    }

    func openAppStore() {
        let appStoreOpenUrlString = "itms-apps://itunes.apple.com/app/apple-store/6450888392"
        guard let url = URL(string: appStoreOpenUrlString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

private extension String {
    func intAndRemoveDot() -> Int? {
        Int(self.replacingOccurrences(of: ".", with: ""))
    }
}
