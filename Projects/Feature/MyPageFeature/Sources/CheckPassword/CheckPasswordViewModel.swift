import BaseFeature
import StudentsDomainInterface
import Combine

final class CheckPasswordViewModel: BaseViewModel {
    @Published var password: String = ""
    @Published var isSuccessCheckPassword: Bool = false

    private let compareCurrentPassswordUseCase: CompareCurrentPassswordUseCase

    init(compareCurrentPassswordUseCase: any CompareCurrentPassswordUseCase) {
        self.compareCurrentPassswordUseCase = compareCurrentPassswordUseCase
    }

    func checkPasswordButtonDidTap() {
        addCancellable(
            compareCurrentPassswordUseCase.execute(password: password)
        ) { [weak self] _ in
            self?.isSuccessCheckPassword = true
        }
    }
}
