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
    @Published var imageUrls: [String] = []
    @Published var showActionSheet: Bool = false
    @Published var isSuccessReport: Bool = false

    public var isReportButtonDisable: Bool {
        title.isEmpty || content.isEmpty
    }

    private let reportBugsUseCase: ReportBugsUseCase
    private let uploadFilesUseCase: UploadFilesUseCase

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
        guard !images.isEmpty else {
            self.reportBugs(urls: [])
            return
        }

        changeImageUrl { [self] in
            reportBugs(urls: imageUrls)
        }
    }

    private func changeImageUrl(action: @escaping  () -> Void) {
        let datas: [Data] = (images.compactMap { $0.pngData() })
        self.addCancellable(
            self.uploadFilesUseCase.execute(
                files: datas.map {
                    .init(file: $0, fileName: "BugImage\($0.hashValue).png")
                }
            )
        ) { [weak self] urls in
            self?.imageUrls = urls
            action()
        }
    }

    private func reportBugs(urls attachmentUrls: [String]) {
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
