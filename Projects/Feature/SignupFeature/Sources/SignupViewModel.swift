import BaseFeature
import StudentsDomainInterface
import Combine

final class SignupViewModel: BaseViewModel {
    @Published var email: String  = ""
    @Published var authCode: String  = ""
    @Published var password: String  = ""
    @Published var checkPassword: String  = ""
    @Published var grade: String?
    @Published var name: String = ""
    @Published var gender: GenderType?
    @Published var classRoom: String?
    @Published var number: String?
    @Published var isSuccessSignup = false

    private let signupUseCase: SignupUseCase

    public init(signupUseCase: any SignupUseCase) {
        self.signupUseCase = signupUseCase
    }

    func signupButtonDidTap() {
        addCancellable(
            signupUseCase.execute(
                req: .init(
                    email: email,
                    password: password,
                    grade: Int(grade ?? ""),
                    name: name,
                    gender: gender,
                    classRoom: Int(classRoom ?? ""),
                    number: Int(number ?? "")
                )
            )
        ) { [weak self] _ in
            self?.isSuccessSignup = true
        }
    }
}
