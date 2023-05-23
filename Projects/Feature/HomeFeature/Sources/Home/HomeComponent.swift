import SwiftUI
import StudentsDomainInterface
import HomeFeatureInterface
import NeedleFoundation

public protocol HomeDependency: Dependency {
    var recruitmentComponent: RecruitmentComponent { get }
}

public final class HomeComponent: Component<HomeDependency>, HomeFactory {
    public func makeView() -> some View {
        NavigationView {
            HomeView(
                viewModel: .init(),
                recruitmentComponent: dependency.recruitmentComponent
            )
        }
    }
}
