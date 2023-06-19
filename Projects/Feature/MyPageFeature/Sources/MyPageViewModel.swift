import BaseFeature
import Combine
import StudentsDomainInterface

final class MyPageViewModel: BaseViewModel {
    @Published var isNavigateBookmarkListView = false
    var isTabbarHidden: Bool {
        isNavigateBookmarkListView
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

