import BaseFeature
import Combine
import CodesDomainInterface
import ReviewsDomainInterface

final class PostReviewViewModel: BaseViewModel {
    @Published var jobCodeList: CodeListEntity?
    @Published var selectedJobCode: CodeEntity = .init(code: 0, keyword: "")
    @Published var qnaElements: [QnaElementRequestDTO] = [
        .init(question: "", answer: "", codeID: 0)
    ]
    @Published var isSuccessPost: Bool = false

    private let fetchCodesUseCase: FetchCodesUseCase
    private let postReviewUseCase: PostReviewUseCase

    init(
        fetchCodesUseCase: FetchCodesUseCase,
        postReviewUseCase: PostReviewUseCase
    ) {
        self.fetchCodesUseCase = fetchCodesUseCase
        self.postReviewUseCase = postReviewUseCase
    }

    func onAppear() {
        fetchJobCodeList()
    }

    private func fetchJobCodeList() {
        addCancellable(
            fetchCodesUseCase.execute(
                keyword: nil,
                type: .job,
                parentCode: nil
            )
        ) { [weak self] jobCodeList in
            guard let codesFirst = jobCodeList.codes.first else { return }
            self?.selectedJobCode = codesFirst
            self?.jobCodeList = jobCodeList
        }
    }

    func postReview(companyID: Int) {
        let qnaElements = self.qnaElements.map {
            QnaElementRequestDTO(
                question: $0.question,
                answer: $0.answer,
                codeID: selectedJobCode.code
            )
        }

        addCancellable(
            postReviewUseCase.execute(
                req: .init(
                    companyID: companyID,
                    qnaElements: qnaElements
                )
            )
        ) { [weak self] _ in
            self?.isSuccessPost = true
        }
    }
}
