import BaseFeature
import RecruitmentsDomainInterface
import BookmarksDomainInterface
import Combine

final class RecruitmentViewModel: BaseViewModel {
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
        self.listPage = 1
        fetchRecruitment()
    }

    private func fetchRecruitment() {
        addCancellable(
            fetchRecruitmentListUseCase.execute(page: listPage, codeId: nil, company: nil)
        ) { [weak self] recruitmentList in
            self?.recruitmentList = recruitmentList
        }
    }

    func appendRecruitmentList(list: RecruitmentEntity) {
        if self.recruitmentList?.recruitments.last == list {
            listPage += 1
            addCancellable(
                fetchRecruitmentListUseCase.execute(
                    page: listPage, codeId: nil, company: nil
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