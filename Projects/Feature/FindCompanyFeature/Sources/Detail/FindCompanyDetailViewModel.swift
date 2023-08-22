import BaseFeature
import CompaniesDomainInterface
import ReviewsDomainInterface
import Combine

final class FindCompanyDetailViewModel: BaseViewModel {
    @Published var companyInfoDetail: CompanyInfoDetailEntity?
    @Published var isNavigateRecruitmentDetail = false
    @Published var reviewList: ReviewListEntity?
    @Published var reviewDetail: ReviewDetailEntity?
    @Published var titles: [String] = []
    @Published var contents: [String] = []

    private let id: String

    private let fetchCompanyInfoDetailUseCase: FetchCompanyInfoDetailUseCase
    private let fetchReviewListUseCase: FetchReviewListUseCase
    private let fetchReviewDetailUseCase: FetchReviewDetailUseCase

    public init(
        fetchCompanyInfoDetailUseCase: any FetchCompanyInfoDetailUseCase,
        fetchReviewListUseCase: any FetchReviewListUseCase,
        fetchReviewDetailUseCase: any FetchReviewDetailUseCase,
        id: String
    ) {
        self.fetchCompanyInfoDetailUseCase = fetchCompanyInfoDetailUseCase
        self.fetchReviewListUseCase = fetchReviewListUseCase
        self.fetchReviewDetailUseCase = fetchReviewDetailUseCase
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
            let insertTitles = [
                "대표자",
                "대표서비스",
                "사업분야",
                "설립일",
                "근로자 수",
                "연매출",
                "주소(본사)",
                "주소(지점)",
                "담당자1",
                "전화번호1",
                "담당자2",
                "전화번호2",
                "이메일",
                "팩스"
            ]
            let insertContents: [String?] = [
                companyInfoDetail.representativeName,
                companyInfoDetail.serviceName,
                companyInfoDetail.businessArea,
                companyInfoDetail.foundedAt,
                companyInfoDetail.workerNumber,
                companyInfoDetail.take,
                companyInfoDetail.mainAddress,
                companyInfoDetail.subAddress,
                companyInfoDetail.managerName,
                companyInfoDetail.managerPhoneNo,
                companyInfoDetail.subManagerName,
                companyInfoDetail.subManagerPhoneNo,
                companyInfoDetail.email,
                companyInfoDetail.fax
            ]
            zip(insertTitles, insertContents).forEach { (title, content) in
                self?.titles.append(title)
                if let content {
                    if content.isEmpty {
                        self?.contents.append("없음")
                    } else {
                        self?.contents.append(content)
                    }
                }
            }
        }
    }

    private func fetchReviewList() {
        addCancellable(
            fetchReviewListUseCase.execute(id: id)
        ) { [weak self] reviewList in
            self?.reviewList = reviewList
        }
    }

    func fetchReviewDetail(id: String) {
        addCancellable(
            fetchReviewDetailUseCase.execute(id: id)
        ) { [weak self] reviewDetail in
            self?.reviewDetail = reviewDetail
        }
    }
}
