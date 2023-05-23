import BaseFeature
import RecruitmentsDomainInterface
import Combine

final class RecruitmentViewModel: BaseViewModel {
    @Published var recruitmentList: RecruitmentListEntity?

    private let fetchRecruitmentListUseCase: FetchRecruitmentListUseCase

    public init(fetchRecruitmentListUseCase: any FetchRecruitmentListUseCase) {
        self.fetchRecruitmentListUseCase = fetchRecruitmentListUseCase
    }

    func onAppear() {
        addCancellable(
            fetchRecruitmentListUseCase.execute(page: 1, codeId: nil, company: nil)
        ) { [weak self] recruitmentList in
            self?.recruitmentList = recruitmentList
        }
    }
}
