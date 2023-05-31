import BaseFeature
import RecruitmentsDomainInterface
import BookmarksDomainInterface
import Combine

final class RecruitmentViewModel: BaseViewModel {
    @Published var companyText: String = ""
    @Published var filteringName: String = ""
    @Published var listPage: Int = 1
    @Published var recruitmentList: RecruitmentListEntity?
    @Published var isNavigateRecruitmentDetail: Bool = false

    private let fetchRecruitmentListUseCase: FetchRecruitmentListUseCase
    private let bookmarkUseCase: BookmarkUseCase

    public init(
        fetchRecruitmentListUseCase: any FetchRecruitmentListUseCase,
        bookmarkUseCase: any BookmarkUseCase
    ) {
        self.fetchRecruitmentListUseCase = fetchRecruitmentListUseCase
        self.bookmarkUseCase = bookmarkUseCase
    }

    func onAppear() {
        fetchRecruitment()
    }

    func fetchRecruitment() {
        self.listPage = 1

        addCancellable(
            fetchRecruitmentListUseCase.execute(
                page: listPage,
                codeId: nil,
                name: companyText.isEmpty ? nil : companyText
            )
        ) { [weak self] recruitmentList in
            self?.filteringName = self?.companyText ?? ""
            self?.recruitmentList = recruitmentList
        }
    }

    func appendRecruitmentList(list: RecruitmentEntity) {
        if self.recruitmentList?.recruitments.last == list {
            listPage += 1
            addCancellable(
                fetchRecruitmentListUseCase.execute(
                    page: listPage,
                    codeId: nil,
                    name: companyText.isEmpty ? nil : companyText
                )
            ) { [weak self] recruitmentList in
                self?.recruitmentList?.recruitments.append(contentsOf: recruitmentList.recruitments)
            }
        }
    }

    func bookmark(id: Int) {
        addCancellable(
            bookmarkUseCase.execute(id: id)
        ) { _ in }
    }
}
