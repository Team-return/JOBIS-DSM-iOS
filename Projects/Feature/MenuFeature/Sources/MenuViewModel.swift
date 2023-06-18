import BaseFeature
import Combine

final class MenuViewModel: BaseViewModel {
    @Published var isNavigateMyPage = false
    @Published var isNavigateRecruitmentView = false
    @Published var isNavigateCompanyView = false
    @Published var isNavigateBookmarkListView = false
    var isTabbarHidden: Bool {
        isNavigateMyPage || isNavigateRecruitmentView || isNavigateCompanyView || isNavigateBookmarkListView
    }
}
