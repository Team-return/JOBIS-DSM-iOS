import BaseFeature
import Combine

final class MyPageViewModel: BaseViewModel {
    @Published var isNavigateBookmarkListView = false
    var isTabbarHidden: Bool {
        isNavigateBookmarkListView
    }
}
