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

        DispatchQueue.global().async {
            let group = DispatchGroup()
            let dispatchQueue = DispatchQueue(label: "imageProcessingQueue", attributes: .concurrent)
            var imageDataArray = [Data?](repeating: nil, count: self.images.count)

            for (index, image) in self.images.enumerated() {
                group.enter()
                dispatchQueue.async {
                    if let imageData = image.pngData() {
                        imageDataArray[index] = imageData
                    }
                    group.leave()
                }
            }

            group.wait()

            DispatchQueue.main.async {
                let data = imageDataArray.compactMap { $0 }

                self.addCancellable(
                    self.uploadFilesUseCase.execute(data: data, fileName: "bugsImage.png")
                ) { [weak self] urls in
                    self?.reportBugs(urls: urls)
                }
            }
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
