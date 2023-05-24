import BaseFeature
import Combine
import ApplicationsDomainInterface

final class HomeViewModel: BaseViewModel {
    @Published var applicationList: ApplicationListEntity?
    @Published var studentInfo: StudentInfoEntity?
    @Published var isNavigateRecruitment: Bool = false
    @Published var isNavigateFindWorkSpace: Bool = false

    private let fetchApplicationUseCase: FetchApplicationUseCase
    private let fetchStudentInfoUseCase: FetchStudentInfoUseCase

    public init(fetchApplicationUseCase: any FetchApplicationUseCase) {
        fetchStudentInfoUseCase: any FetchStudentInfoUseCase
        self.fetchApplicationUseCase = fetchApplicationUseCase
        self.fetchStudentInfoUseCase = fetchStudentInfoUseCase
    }

    func onAppear() {
        addCancellable(
            fetchApplicationUseCase.execute()
        ) { [weak self] applicationList in
            self?.applicationList = applicationList
        }
    }
    private func fetchStudentInfo() {
        addCancellable(
            fetchStudentInfoUseCase.execute()
        ) { [weak self] studentInfo in
            self?.studentInfo = studentInfo
        }
    }
}
