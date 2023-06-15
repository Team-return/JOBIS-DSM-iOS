import BaseFeature
import RecruitmentFeatureInterface
import RecruitmentsDomainInterface
import BookmarksDomainInterface
import CodesDomainInterface
import Combine

final class RecruitmentViewModel: BaseViewModel {
    @Published var techCodeText: String = "" {
        didSet {
            if !techCodeText.isEmpty {
                techCodeList = fetchTechCodeList.filter {
                    $0.keyword.localizedCaseInsensitiveContains(techCodeText)
                }
            } else {
                techCodeList = fetchTechCodeList
            }
        }
    }
    @Published var companyText: String = ""
    @Published var filteringName: String = ""
    @Published var listPage: Int = 1

    @Published var recruitmentList: RecruitmentListEntity?
    @Published var selectedJobCode: CodeEntity? {
        didSet {
            fetchCodeList(codeType: .tech, code: selectedJobCode?.code)
        }
    }
    @Published var selectedTechCode: [CodeEntity] = []
    @Published var techCodeList: [CodeEntity] = []
    @Published var jobCodeList: [CodeEntity] = []
    var fetchTechCodeList: [CodeEntity] = []

    @Published var isNavigateRecruitmentDetail: Bool = false
    @Published var isShowFilterSheet: Bool = false

    private let fetchCodesUseCase: FetchCodesUseCase
    private let fetchRecruitmentListUseCase: FetchRecruitmentListUseCase
    private let bookmarkUseCase: BookmarkUseCase

    public init(
        fetchCodeUseCase: any FetchCodesUseCase,
        fetchRecruitmentListUseCase: any FetchRecruitmentListUseCase,
        bookmarkUseCase: any BookmarkUseCase
    ) {
        self.fetchCodesUseCase = fetchCodeUseCase
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
                code: selectedTechCode.map { String($0.code) },
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
                    code: selectedTechCode.map { String($0.code) },
                    name: companyText.isEmpty ? nil : companyText
                )
            ) { [weak self] recruitmentList in
                self?.recruitmentList?.recruitments.append(contentsOf: recruitmentList.recruitments)
            }
        }
    }

    func bookmark(id: Int) {
        addCancellable(bookmarkUseCase.execute(id: id)) { _ in }
    }

    func sheetOnAppear() {
        fetchCodeList(codeType: .job)
        fetchCodeList(codeType: .tech)
    }

    private func fetchCodeList(codeType: CodeType, code: Int? = nil) {
        var keyword: String? {
            switch codeType {
            case .tech:
                return techCodeText.isEmpty ? nil : techCodeText
            case .job:
                return nil
            }
        }
        var parentCode: String? {
            if let code {
                return String(code)
            } else {
                return nil
            }
        }
        addCancellable(
            fetchCodesUseCase.execute(
                keyword: keyword,
                type: codeType,
                parentCode: parentCode
            )
        ) { [weak self] codeList in
            switch codeType {
            case .tech:
                self?.fetchTechCodeList = codeList.codes
                self?.techCodeList = codeList.codes
            case .job:
                self?.jobCodeList = codeList.codes
            }
        }
    }
}
