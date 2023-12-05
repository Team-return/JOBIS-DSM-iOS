import BaseFeature
import Combine
import SwiftUI
import UIKit
import StudentsDomainInterface
import AuthDomainInterface
import FilesDomainInterface
import CompaniesDomainInterface

final class MyPageViewModel: BaseViewModel {
    @Published var isNavigatePostReview = false
    @Published var isNavigateReportView = false
    @Published var isNavigateBugListView = false
    @Published var isShowFieldOfInterest = false
    @Published var isNavigateChangePassword = false
    @Published var isPresentedAlert = false
    @Published var alertTitle = ""
    @Published var alertContent = ""
    @Published var isSuccessLogout = false
    @Published var isShowImagePicker = false
    @Published var image: UIImage?
    @Published var profileImage: Image?
    @Published var studentInfo: StudentInfoEntity?
    @Published var writableReviewList: WritableReviewListEntity?
    var isTabbarHidden: Bool {
        isNavigateReportView ||
        isNavigateChangePassword ||
        isNavigateBugListView ||
        isNavigatePostReview
    }

    private let fetchStudentInfoUseCase: any FetchStudentInfoUseCase
    private let logoutUseCase: any LogoutUseCase
    private let uploadFilesUseCase: any UploadFilesUseCase
    private let changeProfileImageUseCase: any ChangeProfileImageUseCase
    private let fetchWritableReviewListUseCase: any FetchWritableReviewListUseCase

    public init(
        fetchStudentInfoUseCase: any FetchStudentInfoUseCase,
        logoutUseCase: any LogoutUseCase,
        uploadFilesUseCase: any UploadFilesUseCase,
        changeProfileImageUseCase: any ChangeProfileImageUseCase,
        fetchWritableReviewListUseCase: any FetchWritableReviewListUseCase
    ) {
        self.fetchStudentInfoUseCase = fetchStudentInfoUseCase
        self.logoutUseCase = logoutUseCase
        self.uploadFilesUseCase = uploadFilesUseCase
        self.changeProfileImageUseCase = changeProfileImageUseCase
        self.fetchWritableReviewListUseCase = fetchWritableReviewListUseCase
    }

    func onAppear() {
        fetchStudentInfo()
        fetchWritableReviewList()
    }

    func showLogoutAlert() {
        self.isPresentedAlert.toggle()
        self.alertTitle = "로그아웃"
        self.alertContent = "정말로 로그아웃하시겠습니까?"
    }

    func showWithdrawAlert() {
        self.isPresentedAlert.toggle()
        self.alertTitle = "회원탈퇴"
        self.alertContent = "정말로 회원탈퇴를 하시겠습니까?\n계정은 복구할 수 없습니다."
    }

    private func fetchStudentInfo() {
        addCancellable(
            fetchStudentInfoUseCase.execute()
        ) { [weak self] studentInfo in
            self?.studentInfo = StudentInfoEntity(
                studentName: studentInfo.studentName,
                studentGcn: studentInfo.studentGcn.formatAsGradeClassStudent(),
                department: studentInfo.department,
                profileImageUrl: studentInfo.profileImageUrl
            )
        }
    }

    private func fetchWritableReviewList() {
        addCancellable(
            fetchWritableReviewListUseCase.execute()
        ) { [weak self] writableReviewList in
            self?.writableReviewList = writableReviewList
        }
    }

    func changeProfileImageDidSelected() {
        guard let data = image?.pngData() else { return }

        addCancellable(
            uploadFilesUseCase.execute(files: [.init(data: data, name: "profileImage.png")])
        ) { [weak self] urls in
            guard let url = urls.first else { return }
            self?.changeProfileImage(url: url)
        }
    }

    private func changeProfileImage(url: String) {
        addCancellable(
            changeProfileImageUseCase.execute(url: url)
        ) { [weak self] _ in
            self?.fetchStudentInfo()
        }
    }

    func confirmLogoutButtonDidTap() {
        logoutUseCase.execute()
        isSuccessLogout = true
    }
}
