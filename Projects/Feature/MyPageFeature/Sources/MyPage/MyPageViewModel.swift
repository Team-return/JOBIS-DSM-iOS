import BaseFeature
import Combine
import StudentsDomainInterface
import AuthDomainInterface

final class MyPageViewModel: BaseViewModel {
    @Published var isNavigateReportView = false
    @Published var isShowFieldOfInterest = false
    @Published var isNavigateChangePassword = false
    @Published var isPresentedLogoutAlert = false
    @Published var isSuccessLogout = false
    @Published var studentInfo: StudentInfoEntity?
    var isTabbarHidden: Bool {
        isNavigateReportView || isNavigateChangePassword
    }

    private let fetchStudentInfoUseCase: FetchStudentInfoUseCase
    private let logoutUseCase: any LogoutUseCase

    public init(
        fetchStudentInfoUseCase: any FetchStudentInfoUseCase,
        logoutUseCase: any LogoutUseCase
    ) {
        self.fetchStudentInfoUseCase = fetchStudentInfoUseCase
        self.logoutUseCase = logoutUseCase
    }

    func onAppear() {
        fetchStudentInfo()
    }

    private func fetchStudentInfo() {
        addCancellable(
            fetchStudentInfoUseCase.execute()
        ) { [weak self] studentInfo in
            self?.studentInfo = StudentInfoEntity(
                studentName: studentInfo.studentName,
                studentGcn: studentInfo.studentGcn.formatAsGradeClassStudent(),
                department: studentInfo.department,
                profileImageUrl: studentInfo.profileImageUrl
            )
        }
    }

    func logoutButtonDidTap() {
        isPresentedLogoutAlert = true
    }

    func confirmLogoutButtonDidTap() {
        logoutUseCase.execute()
        isSuccessLogout = true
    }
}
