import BaseFeature
import Combine
import AuthDomainInterface
import UsersDomainInterface

final class SplashViewModel: BaseViewModel {
    private let reissueTokenUseCase: any ReissueTokenUseCase

    public init(
        reissueTokenUseCase: any ReissueTokenUseCase
    ) {
        self.reissueTokenUseCase = reissueTokenUseCase
    }

    func onAppear(
        onSuccess: @escaping (AuthorityType) -> Void,
        onError: @escaping (Error) -> Void
    ) {
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
