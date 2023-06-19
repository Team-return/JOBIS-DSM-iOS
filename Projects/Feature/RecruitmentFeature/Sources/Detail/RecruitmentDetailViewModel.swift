import BaseFeature
import RecruitmentsDomainInterface
import Combine

final class RecruitmentDetailViewModel: BaseViewModel {
    @Published var recruitmentDetail: RecruitmentDetailEntity?
    @Published var isTappedApplyButton = false
    @Published var isSheetCompanyDetail = false
    @Published var titles: [String] = []
    @Published var contents: [String] = []
    @Published var urls: [String] = []
    private let id: String

    private let fetchRecruitmentDetailUseCase: FetchRecruitmentDetailUseCase

    public init(
        fetchRecruitmentDetailUseCase: any FetchRecruitmentDetailUseCase,
        id: String
    ) {
        self.fetchRecruitmentDetailUseCase = fetchRecruitmentDetailUseCase
        self.id = id
    }

    func onAppear() {
        fetchRecruitmentDetail()
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
