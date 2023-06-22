import SwiftUI
import StudentsDomainInterface
import NeedleFoundation
import MyPageFeatureInterface

public protocol CheckPasswordDependency: Dependency {
    var compareCurrentPassswordUseCase: any CompareCurrentPassswordUseCase { get }
    var modifyPasswordFactory: any ModifyPasswordFactory { get }
}

public final class CheckPasswordComponent: Component<CheckPasswordDependency>, CheckPasswordFactory {
    public func makeView() -> some View {
        CheckPasswordView(
            viewModel: .init(
                compareCurrentPassswordUseCase: dependency.compareCurrentPassswordUseCase
            ),
            modifyPasswordFactory: dependency.modifyPasswordFactory
        )
    }
}
