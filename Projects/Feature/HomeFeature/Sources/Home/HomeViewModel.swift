import BaseFeature
import Combine
import ApplicationsDomainInterface

final class HomeViewModel: BaseViewModel {
    @Published var applicationList: ApplicationListEntity?
    @Published var isNavigateRecruitment: Bool = false
    @Published var isNavigateFindWorkSpace: Bool = false

    private let fetchApplicationUseCase: FetchApplicationUseCase

    public init(fetchApplicationUseCase: any FetchApplicationUseCase) {
        self.fetchApplicationUseCase = fetchApplicationUseCase
    }

    func onAppear() {
        addCancellable(
            fetchApplicationUseCase.execute()
        ) { [weak self] applicationList in
            self?.applicationList = applicationList
        }
    }
}
