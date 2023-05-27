import BaseFeature
import Combine
import ApplicationsDomainInterface
import StudentsDomainInterface

final class HomeViewModel: BaseViewModel {
    @Published var applicationList: ApplicationListEntity?
    @Published var totalPassStudent: TotalPassStudentEntity?
    @Published var studentInfo: StudentInfoEntity?
    @Published var isNavigateRecruitment: Bool = false
    @Published var isNavigateFindCompany: Bool = false

    private let fetchApplicationUseCase: FetchApplicationUseCase
    private let fetchTotalPassStudentUseCase: FetchTotalPassStudentUseCase
    private let fetchStudentInfoUseCase: FetchStudentInfoUseCase

    public init(
        fetchApplicationUseCase: any FetchApplicationUseCase,
        fetchTotalPassStudentUseCase: any FetchTotalPassStudentUseCase,
        fetchStudentInfoUseCase: any FetchStudentInfoUseCase
    ) {
        self.fetchApplicationUseCase = fetchApplicationUseCase
        self.fetchTotalPassStudentUseCase = fetchTotalPassStudentUseCase
        self.fetchStudentInfoUseCase = fetchStudentInfoUseCase
    }

    func onAppear() {
        fetchApplication()
        fetchStudentInfo()
        fetchTotalPassStudent()
    }

    private func fetchApplication() {
        addCancellable(
            fetchApplicationUseCase.execute()
        ) { [weak self] applicationList in
            self?.applicationList = applicationList
        }
    }

    private func fetchTotalPassStudent() {
        addCancellable(
            fetchTotalPassStudentUseCase.execute()
        ) { [weak self] totalPassStudent in
            self?.totalPassStudent = totalPassStudent
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
