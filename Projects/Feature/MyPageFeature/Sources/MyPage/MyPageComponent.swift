import SwiftUI
import BugFeatureInterface
import FilesDomainInterface
import NeedleFoundation
import MyPageFeatureInterface
import PostReviewFeatureInterface
import StudentsDomainInterface
import AuthDomainInterface
import CompaniesDomainInterface

public protocol MyPageDependency: Dependency {
    var fetchStudentInfoUseCase: any FetchStudentInfoUseCase { get }
    var logoutUseCase: any LogoutUseCase { get }
    var uploadFilesUseCase: any UploadFilesUseCase { get }
    var changeProfileImageUseCase: any ChangeProfileImageUseCase { get }
    var fetchWritableReviewListUseCase: any FetchWritableReviewListUseCase { get }
    var reportFactory: any ReportFactory { get }
    var bugListFactory: any BugListFactory { get }
    var checkPasswordFactory: any CheckPasswordFactory { get }
    var postReviewFactory: any PostReviewFactory { get }
}

public final class MyPageComponent: Component<MyPageDependency>, MyPageFactory {
    public func makeView() -> some View {
        MyPageView(
            viewModel: .init(
                fetchStudentInfoUseCase: dependency.fetchStudentInfoUseCase,
                logoutUseCase: dependency.logoutUseCase,
                uploadFilesUseCase: dependency.uploadFilesUseCase,
                changeProfileImageUseCase: dependency.changeProfileImageUseCase,
                fetchWritableReviewListUseCase: dependency.fetchWritableReviewListUseCase
            ),
            reportFactory: dependency.reportFactory,
            bugListFactory: dependency.bugListFactory,
            checkPasswordFactory: dependency.checkPasswordFactory,
            postReviewFactory: dependency.postReviewFactory
        )
    }
}
