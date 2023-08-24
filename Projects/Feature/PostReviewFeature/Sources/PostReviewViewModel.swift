import BaseFeature
import Combine
import CodesDomainInterface
import ReviewsDomainInterface

struct QnaElementEntity: Equatable {
    public var question, answer: String
    public var code: CodeEntity

    public init(question: String, answer: String, code: CodeEntity) {
        self.question = question
        self.answer = answer
        self.code = code
    }
}

final class PostReviewViewModel: BaseViewModel {
    @Published var jobCodeList: CodeListEntity?
    @Published var qnaElements: [QnaElementEntity] = [
        .init(question: "", answer: "", code: .init(code: 0, keyword: "직무"))
    ]
    @Published var isSuccessPost: Bool = false
    @Published var isErrorPostReview: Bool = false

    var isDisabledPostButton: Bool {
        var returnValue = false
        for qna in qnaElements {
            if qna.question.isEmpty ||
                qna.answer.isEmpty ||
                qna.code.code == 0 {
                returnValue = true
                break
            }
        }
        return returnValue
    }

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
            self?.jobCodeList = jobCodeList
        }
    }

    func postReview(companyID: Int) {
        addCancellable(
            postReviewUseCase.execute(
                req: .init(
                    companyID: companyID,
                    qnaElements: qnaElements.map {
                        QnaElementRequestDTO(
                            question: $0.question,
                            answer: $0.answer,
                            codeID: $0.code.code
                        )
                    }
                )
            )
        ) { [weak self] _ in
            self?.isSuccessPost = true
        }
    }
}
