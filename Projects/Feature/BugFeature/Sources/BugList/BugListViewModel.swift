import BaseFeature
import Combine
import BugsDomainInterface
import DesignSystem

final class BugListViewModel: BaseViewModel {
    let devMajors: [DevelopmentType] = [
        .all,
        .server,
        .ios,
        .web
    ]
    @Published var selectedDepartment: DevelopmentType = .all
    @Published var bugList: BugListEntity?
    @Published var bugDetail: BugDetailEntity?

    private let fetchBugListUseCase: FetchBugListUseCase
    private let fetchBugDetailUseCase: FetchBugDetailUseCase

    init(fetchBugListUseCase: FetchBugListUseCase, fetchBugDetailUseCase: FetchBugDetailUseCase) {
        self.fetchBugListUseCase = fetchBugListUseCase
        self.fetchBugDetailUseCase = fetchBugDetailUseCase
    }

    func onAppear() {
        fetchBugList()
    }

    private func fetchBugList() {
        addCancellable(
            fetchBugListUseCase.execute(developmentType: selectedDepartment)
        ) { [weak self] bugList in
            self?.bugList = bugList
        }
    }

    func fetchBugDetail(id: Int) {
        addCancellable(
            fetchBugDetailUseCase.execute(id: id)
        ) { [weak self] bugDetail in
            self?.bugDetail = bugDetail
        }
    }
}

extension DevelopmentType {
    func developIcon() -> JOBISIcon {
        switch self {
        case .all:
            return JOBISIcon(.jobis)

        case .server:
            return JOBISIcon(.dataBase)

        case .web:
            return JOBISIcon(.webScreen)

        case .android:
            return JOBISIcon(.android)

        case .ios:
            return JOBISIcon(.ios)
        }
    }
}
