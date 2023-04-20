import BaseFeature
import Combine

final class SignupPasswordViewModel: BaseViewModel {
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
    @Published var password: String = ""
    @Published var checkPassword: String = ""

    func nextButtonDidTap() {
        print("next!")
    }
}
