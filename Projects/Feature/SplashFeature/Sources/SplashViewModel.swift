import BaseFeature
import Combine
import AuthDomainInterface

final class SplashViewModel: BaseViewModel {
    private let reissueTokenUseCase: any ReissueTokenUseCase

    public init(
        reissueTokenUseCase: any ReissueTokenUseCase
    ) {
        self.reissueTokenUseCase = reissueTokenUseCase
    }

    func onAppear(
        onSuccess: @escaping () -> Void,
        onError: @escaping (Error) -> Void
    ) {
        addCancellable(reissueTokenUseCase.execute()) { _ in
            onSuccess()
        } onReceiveError: { error in
            onError(error)
        }
    }
}
