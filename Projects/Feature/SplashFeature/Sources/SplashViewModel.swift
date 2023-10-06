import BaseFeature
import UIKit
import Combine
import AuthDomainInterface
import UsersDomainInterface

final class SplashViewModel: BaseViewModel {
    private let reissueTokenUseCase: any ReissueTokenUseCase
    @Published var showUpdateAlert: Bool = false
    @Published var showUpdateForceAlert: Bool = false
    public var alertTitle = ""
    public var alertMessage = ""
    private let appleID = "6450888392"

    public init(
        reissueTokenUseCase: any ReissueTokenUseCase
    ) {
        self.reissueTokenUseCase = reissueTokenUseCase
    }

    func onAppear(
        onSuccess: @escaping (AuthorityType) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        update {
            addCancellable(reissueTokenUseCase.execute()) { authority in
                if authority {
                    onSuccess(.developer)
                } else {
                    onSuccess(.student)
                }
            } onReceiveError: { error in
                onError(error)
            }
        }
    }

    private func update(action: () -> Void) {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

        let latestVersion: String? = {
            guard let url = URL(string: "http://itunes.apple.com/lookup?id=\(self.appleID)&country=kr"),
                  let data = try? Data(contentsOf: url),
                  let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
                  let results = json["results"] as? [[String: Any]],
                  let appStoreVersion = results[0]["version"] as? String else {
                return nil
            }
            return appStoreVersion
        }()

        let marketingVersion = latestVersion!
        let currentProjectVersion = appVersion!
        let splitMarketingVersion = marketingVersion.split(separator: ".").map {$0}
        let splitCurrentProjectVersion = currentProjectVersion.split(separator: ".").map {$0}

        alertTitle = "업데이트 알림"
        alertMessage = "JOBIS의 새로운 버전이 있습니다.\n\(marketingVersion) 버전으로 업데이트 해주세요."
        if splitCurrentProjectVersion[0] < splitMarketingVersion[0] {
            showUpdateForceAlert.toggle()
        } else if  splitCurrentProjectVersion[1] < splitMarketingVersion[1] {
            showUpdateForceAlert.toggle()
        } else {
            showUpdateAlert.toggle()
        }
    }

    func openAppStore() {
        let appStoreOpenUrlString = "itms-apps://itunes.apple.com/app/apple-store/\(appleID)"
        guard let url = URL(string: appStoreOpenUrlString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
