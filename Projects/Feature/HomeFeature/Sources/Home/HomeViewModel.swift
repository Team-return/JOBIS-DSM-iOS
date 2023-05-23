import BaseFeature
import Combine
import StudentsDomainInterface

final class HomeViewModel: BaseViewModel {
    @Published var mainPageInfo: MainPageInfoEntity?
    @Published var isNavigateRecruitment: Bool = false
    @Published var isNavigateFindWorkSpace: Bool = false

    private let fetchMainPageInfoUseCase: FetchMainPageInfoUseCase

    public init(fetchMainPageInfoUseCase: any FetchMainPageInfoUseCase) {
        self.fetchMainPageInfoUseCase = fetchMainPageInfoUseCase
    }

    func onAppear() {
        addCancellable(
            fetchMainPageInfoUseCase.execute()
        ) { [weak self] mainPageInfo in
            self?.mainPageInfo = mainPageInfo
        }
    }
}
