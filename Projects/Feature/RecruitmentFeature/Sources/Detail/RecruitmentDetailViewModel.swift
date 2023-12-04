import BaseFeature
import FilesDomainInterface
import Foundation
import RecruitmentsDomainInterface
import ApplicationsDomainInterface
import Combine

final class RecruitmentDetailViewModel: BaseViewModel {
    @Published var recruitmentDetail: RecruitmentDetailEntity?
    @Published var isTappedApplyButton = false
    @Published var isNavigateCompanyDetail = false
    @Published var isSuccessApply = false
    @Published var titles: [String] = []
    @Published var contents: [String] = []
    @Published var urls: [String] = []
    @Published var documents: [URL] = []

    private let id: String

    private let fetchRecruitmentDetailUseCase: FetchRecruitmentDetailUseCase
    private let uploadFilesUseCase: UploadFilesUseCase
    private let applyCompanyUseCase: ApplyCompanyUseCase

    public init(
        fetchRecruitmentDetailUseCase: any FetchRecruitmentDetailUseCase,
        uploadFilesUseCase: any UploadFilesUseCase,
        applyCompanyUseCase: any ApplyCompanyUseCase,
        id: String
    ) {
        self.fetchRecruitmentDetailUseCase = fetchRecruitmentDetailUseCase
        self.uploadFilesUseCase = uploadFilesUseCase
        self.applyCompanyUseCase = applyCompanyUseCase
        self.id = id
    }

    func onAppear() {
        if titles.isEmpty || contents.isEmpty {
            fetchRecruitmentDetail()
        }
    }

    func apply(complete: @escaping () -> Void) {
        uploadFiles(complete: complete)
    }

    private func applyCompany(
        _ attachments: [AttachmentsRequestDTO],
        complete: @escaping () -> Void
    ) {
        addCancellable(
            applyCompanyUseCase.execute(
                id: id,
                req: .init(attachments: attachments)
            )
        ) { [weak self] _ in
            complete()
            self?.isSuccessApply.toggle()
        }
    }

    private func uploadFiles(complete: @escaping () -> Void) {
        if documents.isEmpty {
            self.applyCompany(urls.map { .init(url: $0, type: .url) }, complete: complete)
        } else {
            addCancellable(
                uploadFilesUseCase.execute(
                    data: documents.map {
                        do {
                            let data = try Data(contentsOf: $0)
                            return data
                        } catch {
                            print("URL을 Data로 변환하는 데 실패했습니다: \(error)")
                            return Data()
                        }
                    },
                    fileName: documents.first?.lastPathComponent ?? "image.jpg"
                )
            ) { [weak self] urls in
                var attachments: [AttachmentsRequestDTO] = []

                urls.forEach { attachments.append(.init(url: $0, type: .file)) }
                self?.urls.forEach { attachments.append(.init(url: $0, type: .url)) }
                self?.applyCompany(attachments, complete: complete)
            }
        }
    }

    private func fetchRecruitmentDetail() {
        addCancellable(
            fetchRecruitmentDetailUseCase.execute(id: id)
        ) { [weak self] recruitmentDetail in
            self?.recruitmentDetail = recruitmentDetail
            let insertTitles = [
                "자격증",
                "필수성적",
                "근무시간",
                "실습수당",
                "정규직전환시",
                "복리후생",
                "채용절차",
                "제출서류",
                "기타사항"
            ]
            let insertContents = [
                recruitmentDetail.requiredLicenses,
                recruitmentDetail.requiredGrade,
                recruitmentDetail.workTime,
                (recruitmentDetail.trainPay.intComma() ?? "0") + " 원/월",
                (recruitmentDetail.pay?.intComma() ?? "0") + " 만원/년",
                recruitmentDetail.benefits,
                recruitmentDetail.hiringProgress,
                recruitmentDetail.submitDocument,
                recruitmentDetail.etc
            ]
            zip(insertTitles, insertContents).forEach { (title, content) in
                guard let content, !content.isEmpty else { return }
                self?.titles.append(title)
                self?.contents.append(content)
            }
        }
    }
}
