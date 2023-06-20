import BaseFeature
import Combine
import StudentsDomainInterface

final class MyPageViewModel: BaseViewModel {
    @Published var isNavigateReportView = false
    @Published var isLogout = false
    var isTabbarHidden: Bool {
        isNavigateReportView
    }

    @Published var studentInfo: StudentInfoEntity?

    private let fetchStudentInfoUseCase: FetchStudentInfoUseCase

    public init(
        fetchStudentInfoUseCase: any FetchStudentInfoUseCase
    ) {
        self.fetchStudentInfoUseCase = fetchStudentInfoUseCase
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
}
