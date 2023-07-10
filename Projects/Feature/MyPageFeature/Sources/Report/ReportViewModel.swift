import BaseFeature
import UIKit
import Combine
import BugsDomainInterface
import FilesDomainInterface

final class ReportViewModel: BaseViewModel {
    let devMajors: [DevelopmentType] = [
        .all,
        .server,
        .ios,
        .web
    ]
    @Published var selectedDepartment: DevelopmentType = .all
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var images: [UIImage] = []
    @Published var showActionSheet: Bool = false
    @Published var isSuccessReport: Bool = false

    public var isReportButtonDisable: Bool {
        title.isEmpty || content.isEmpty
    }

    private let reportBugsUseCase: any ReportBugsUseCase
    private let uploadFilesUseCase: any UploadFilesUseCase

    init(
        reportBugsUseCase: any ReportBugsUseCase,
        uploadFilesUseCase: any UploadFilesUseCase
    ) {
        self.reportBugsUseCase = reportBugsUseCase
        self.uploadFilesUseCase = uploadFilesUseCase
    }

    func onAppear() {
        // on appear
    }

    func reportBugsButtonDidTap() {
        let data = images.map { $0.pngData() ?? Data() }

        guard !data.isEmpty else {
            reportBugs(urls: [])
            return
        }

        addCancellable(
            uploadFilesUseCase.execute(data: data, fileName: "bugsImage.png")
        ) { [weak self] urls in
            self?.reportBugs(urls: urls)
        }
    }

    func reportBugs(urls attachmentUrls: [String]) {
        addCancellable(
            reportBugsUseCase.execute(
                req: .init(
                    title: title,
                    content: content,
                    developmentArea: selectedDepartment,
                    attachmentUrls: attachmentUrls
                )
            )
        ) { [weak self] _ in
            self?.isSuccessReport = true
        }
    }
}
