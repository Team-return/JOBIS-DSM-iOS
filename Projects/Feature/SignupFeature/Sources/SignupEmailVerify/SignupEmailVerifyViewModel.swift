import BaseFeature
import Combine

final class SignupEmailVerifyViewModel: BaseViewModel {
    @Published var isMan: Bool = false {
        didSet {
            if self.isMan == true {
                self.isWoman = false
            }
        }
    }
    @Published var isWoman: Bool = false {
        didSet {
            if self.isWoman == true {
                self.isMan = false
            }
        }
    }
    @Published var email: String = ""
    @Published var verifyCode: String = ""
    @Published var isNavigateSignupPassword = false

    func nextButtonDidTap() {
        print("next!")
        self.isNavigateSignupPassword = true
    }
}
