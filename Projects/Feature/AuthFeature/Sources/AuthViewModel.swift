import BaseFeature
import Combine

final class AuthViewModel: BaseViewModel {
    @Published var isPresentedSignin = false
    @Published var isPresentedSignup = false
}
