import BaseFeature
import FilesDomainInterface
import Foundation
import Combine
import ApplicationsDomainInterface
import StudentsDomainInterface

final class HomeViewModel: BaseViewModel {
    @Published var isSuccessApply = false
    @Published var urls: [String] = []
    @Published var documents: [URL] = []
    @Published var applicationList: ApplicationListEntity?
    @Published var totalPassStudent: TotalPassStudentEntity?
    @Published var studentInfo: StudentInfoEntity?
    @Published var showReApplySheet = false
    @Published var rejectionReason: String?
    @Published var selectedId: String? {
        didSet {
            guard let selectedId else { return }
            showReApplySheet(id: selectedId)
        }
    }
    @Published var isNavigateRecruitment: Bool = false
    @Published var isNavigateWinterIntern: Bool = false
    @Published var isNavigateFindCompany: Bool = false

    private let fetchApplicationUseCase: FetchApplicationUseCase
    private let uploadFilesUseCase: UploadFilesUseCase
    private let fetchTotalPassStudentUseCase: FetchTotalPassStudentUseCase
    private let fetchStudentInfoUseCase: FetchStudentInfoUseCase
    private let reApplyCompanyUseCase: ReApplyCompanyUseCase
    private let fetchRejectionReasonUseCase: FetchRejectionReasonUseCase

    public init(
        fetchApplicationUseCase: any FetchApplicationUseCase,
        uploadFilesUseCase: any UploadFilesUseCase,
        fetchTotalPassStudentUseCase: any FetchTotalPassStudentUseCase,
        fetchStudentInfoUseCase: any FetchStudentInfoUseCase,
        reApplyCompanyUseCase: any ReApplyCompanyUseCase,
        fetchRejectionReasonUseCase: FetchRejectionReasonUseCase
    ) {
        self.fetchApplicationUseCase = fetchApplicationUseCase
        self.uploadFilesUseCase = uploadFilesUseCase
        self.fetchTotalPassStudentUseCase = fetchTotalPassStudentUseCase
        self.fetchStudentInfoUseCase = fetchStudentInfoUseCase
        self.reApplyCompanyUseCase = reApplyCompanyUseCase
        self.fetchRejectionReasonUseCase = fetchRejectionReasonUseCase
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

extension HomeViewModel {
    func showReApplySheet(id: String) {
        addCancellable(fetchRejectionReasonUseCase.execute(id: id)) { [weak self] reason in
            self?.rejectionReason = reason
            self?.showReApplySheet = true
        }
    }

    func dismissSheet() {
        showReApplySheet = false
        rejectionReason = nil
        selectedId = nil
    }

    func apply(complete: @escaping () -> Void) {
        uploadFiles(complete: complete)
    }

    private func applyCompany(
        _ attachments: [AttachmentsRequestDTO],
        complete: @escaping () -> Void
    ) {
        guard let selectedId else { return }
        addCancellable(
            reApplyCompanyUseCase.execute(
                id: selectedId,
                req: .init(attachments: attachments)
            )
        ) { [weak self] _ in
            complete()
            self?.isSuccessApply = true
            self?.dismissSheet()
            self?.fetchApplication()
        }
    }

    private func uploadFiles(complete: @escaping () -> Void) {
        if documents.isEmpty {
            self.applyCompany(urls.map { .init(url: $0, type: .url) }, complete: complete)
        } else {
            addCancellable(
                uploadFilesUseCase.execute(
                    files: documents.map {
                        do {
                            let data = try Data(contentsOf: $0)
                            return UploadFilesRequestDTO(data: data, name: $0.lastPathComponent)
                        } catch {
                            print("URL을 Data로 변환하는 데 실패했습니다: \(error)")
                            return UploadFilesRequestDTO(data: Data(), name: "")
                        }
                    }
                )
            ) { [weak self] urls in
                var attachments: [AttachmentsRequestDTO] = []

                urls.forEach { attachments.append(.init(url: $0, type: .file)) }
                self?.urls.forEach { attachments.append(.init(url: $0, type: .url)) }
                self?.applyCompany(attachments, complete: complete)
            }
        }
    }
}
