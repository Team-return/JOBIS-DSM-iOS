import BaseFeature
import StudentsDomainInterface
import AuthDomainInterface
import Combine

final class SignupViewModel: BaseViewModel {
    @Published var email: String  = ""
    @Published var authCode: String  = ""
    @Published var password: String  = ""
    @Published var checkPassword: String  = ""
    @Published var grade: String?
    @Published var name: String = ""
    @Published var gender: String?
    @Published var classRoom: String?
    @Published var number: String?
    @Published var isSuccessSignup = false

    @Published var isEmailError = false
    @Published var isAuthCodeError = false
    @Published var isPasswordError = false
    @Published var isCheckPasswordError = false
    @Published var isNameError = false

    private let signupUseCase: SignupUseCase
    private let sendAuthCodeUseCase: SendAuthCodeUseCase

    public init(
        signupUseCase: any SignupUseCase,
        sendAuthCodeUseCase: any SendAuthCodeUseCase
    ) {
        self.signupUseCase = signupUseCase
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
    }

    func signupButtonDidTap() {
        
    }

    func sendAuthCodeButtonDidTap() {
//        addCancellable(
//            sendAuthCodeUseCase.execute(
//                req: .init(
//                    email: self.email,
//                    authCodeType: self.authCode
//                )
//            )
//        ) { [weak self] _ in
//
//        }
    }
}
