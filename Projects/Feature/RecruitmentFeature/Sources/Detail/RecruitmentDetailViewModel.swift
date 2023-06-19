import BaseFeature
import FilesDomainInterface
import Foundation
import RecruitmentsDomainInterface
import ApplicationsDomainInterface
import Combine

final class RecruitmentDetailViewModel: BaseViewModel {
    @Published var recruitmentDetail: RecruitmentDetailEntity?
    @Published var isTappedApplyButton = false
    @Published var isSheetCompanyDetail = false
    @Published var titles: [String] = []
    @Published var contents: [String] = []
    @Published var urls: [String] = []
    @Published var documents: [URL] = []

    private let id: String

    private let fetchRecruitmentDetailUseCase: FetchRecruitmentDetailUseCase
    private let uploadFileUseCase: UploadFileUseCase
    private let applyCompanyUseCase: ApplyCompanyUseCase

    public init(
        fetchRecruitmentDetailUseCase: any FetchRecruitmentDetailUseCase,
        uploadFileUseCase: any UploadFileUseCase,
        applyCompanyUseCase: any ApplyCompanyUseCase,
        id: String
    ) {
        self.fetchRecruitmentDetailUseCase = fetchRecruitmentDetailUseCase
        self.uploadFileUseCase = uploadFileUseCase
        self.applyCompanyUseCase = applyCompanyUseCase
        self.id = id
    }

    func onAppear() {
        fetchRecruitmentDetail()
    }

    func apply(complete: @escaping () -> Void) {
        uploadFiles(complete: complete)
    }

    private func applyCompany(_ attachmentUrl: [String], complete: @escaping () -> Void) {
        addCancellable(
            applyCompanyUseCase.execute(
                id: id,
                req: .init(attachmentURL: attachmentUrl)
            )
        ) { _ in
            complete()
        }
    }

    private func uploadFiles(complete: @escaping () -> Void) {
        var attachmentUrl: [String] = []
        documents.forEach {
            do {
                let data = try Data(contentsOf: $0)
                addCancellable(
                    uploadFileUseCase.execute(data: data)
                ) { url in
                    attachmentUrl.append(contentsOf: url)
                }
            } catch {
                print("URL을 Data로 변환하는 데 실패했습니다: \(error)")
            }
        }
        attachmentUrl += urls
        self.applyCompany(attachmentUrl, complete: complete)
    }

    private func fetchRecruitmentDetail() {
        addCancellable(
            fetchRecruitmentDetailUseCase.execute(id: id)
        ) { [weak self] recruitmentDetail in
            self?.recruitmentDetail = recruitmentDetail
            self?.titles = [
                "우대사항", "자격증", "근무시간",
                "실습수당", "복리후생", "채용절차",
                "제출서류", "기타사항"
            ]
            self?.contents = [
                recruitmentDetail.preferentialTreatment,
                recruitmentDetail.requiredLicenses,
                recruitmentDetail.workHours + " 시간",
                (recruitmentDetail.trainPay) + " 만원/월",
                recruitmentDetail.benefits,
                recruitmentDetail.hiringProgress,
                recruitmentDetail.submitDocument,
                recruitmentDetail.etc
            ]
            if let requiredGrade = recruitmentDetail.requiredGrade {
                self?.titles.insert("필수성정", at: 2)
                self?.contents.insert(String(requiredGrade), at: 2)
            }
            if let pay = recruitmentDetail.pay {
                self?.titles.insert("정규직전환시", at: 5)
                self?.contents.insert("\(pay) 만원/년", at: 5)
            }
        }
    }
}
