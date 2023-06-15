import BaseFeature
import CompaniesDomainInterface
import ReviewsDomainInterface
import Combine

final class FindCompanyDetailViewModel: BaseViewModel {
    @Published var companyInfoDetail: CompanyInfoDetailEntity?
    @Published var isSheetRecruitmentDetail = false
    @Published var reviewList: ReviewListEntity?
    @Published var titles: [String] = []
    @Published var contents: [String] = []

    private let id: String

    private let fetchCompanyInfoDetailUseCase: FetchCompanyInfoDetailUseCase
    private let fetchReviewListUseCase: FetchReviewListUseCase

    public init(
        fetchCompanyInfoDetailUseCase: any FetchCompanyInfoDetailUseCase,
        fetchReviewListUseCase: any FetchReviewListUseCase,
        id: String
    ) {
        self.fetchCompanyInfoDetailUseCase = fetchCompanyInfoDetailUseCase
        self.fetchReviewListUseCase = fetchReviewListUseCase
        self.id = id
    }

    func onAppear() {
        fetchCompanyInfoDetail()
        fetchReviewList()
    }

    private func fetchCompanyInfoDetail() {
        addCancellable(
            fetchCompanyInfoDetailUseCase.execute(id: id)
        ) { [weak self] companyInfoDetail in
            self?.companyInfoDetail = companyInfoDetail
            self?.titles = [
                "대표자", "설립일", "근로자 수",
                "연매출", "주소(본사)", "주소(지점)",
                "담당자1", "전화번호1", "담당자2",
                "전화번호2", "이메일", "팩스"
            ]
            self?.contents = [
                companyInfoDetail.representativeName,
                companyInfoDetail.foundedAt,
                String(companyInfoDetail.workerNumber),
                String(companyInfoDetail.take),
                companyInfoDetail.address1,
                companyInfoDetail.address2,
                companyInfoDetail.manager1,
                companyInfoDetail.phoneNumber1,
                companyInfoDetail.manager2,
                companyInfoDetail.phoneNumber2,
                companyInfoDetail.email,
                companyInfoDetail.fax
            ]
        }
    }

    private func fetchReviewList() {
        addCancellable(
            fetchReviewListUseCase.execute(id: id)
        ) { [weak self] reviewList in
            self?.reviewList = reviewList
        }
    }
}
