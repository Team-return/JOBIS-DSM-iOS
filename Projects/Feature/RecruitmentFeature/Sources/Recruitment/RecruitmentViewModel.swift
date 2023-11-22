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

    @Published var recruitmentList: RecruitmentListEntity = .init(recruitments: [])
    @Published var selectedJobCode: CodeEntity? {
        didSet {
            fetchCodeList(codeType: .tech)
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
    let winterIntern: Bool

    public init(
        fetchCodeUseCase: any FetchCodesUseCase,
        fetchRecruitmentListUseCase: any FetchRecruitmentListUseCase,
        bookmarkUseCase: any BookmarkUseCase,
        winterIntern: Bool
    ) {
        self.fetchCodesUseCase = fetchCodeUseCase
        self.fetchRecruitmentListUseCase = fetchRecruitmentListUseCase
        self.bookmarkUseCase = bookmarkUseCase
        self.winterIntern = winterIntern
    }

    func onAppear() {
        fetchRecruitment()
    }

    func fetchRecruitment() {
        self.listPage = 1

        var jobCode: String? {
            guard let selectedJobCode = selectedJobCode?.code else { return nil }
            return String(selectedJobCode)
        }

        addCancellable(
            fetchRecruitmentListUseCase.execute(
                page: listPage,
                jobCode: jobCode,
                techCode: selectedTechCode.map { String($0.code) },
                name: companyText,
                winterIntern: winterIntern
            )
        ) { [weak self] recruitmentList in
            self?.filteringName = self?.companyText ?? ""
            self?.recruitmentList = recruitmentList
        }
    }

    func appendRecruitmentList(list: RecruitmentEntity) {
        guard self.recruitmentList.recruitments.last == list else { return }
        var jobCode: String? {
            guard let selectedJobCode = selectedJobCode?.code else { return nil }
            return String(selectedJobCode)
        }

        listPage += 1
        addCancellable(
            fetchRecruitmentListUseCase.execute(
                page: listPage,
                jobCode: jobCode,
                techCode: selectedTechCode.map { String($0.code) },
                name: companyText,
                winterIntern: winterIntern
            )
        ) { [weak self] recruitmentList in
            self?.recruitmentList.recruitments.append(contentsOf: recruitmentList.recruitments)
        }
    }

    func bookmark(id: Int) {
        addCancellable(bookmarkUseCase.execute(id: id)) { _ in }
    }

    func sheetOnAppear() {
        fetchCodeList(codeType: .job)
        fetchCodeList(codeType: .tech)
    }

    private func fetchCodeList(codeType: CodeType) {
        var keyword: String? {
            switch codeType {
            case .tech:
                return techCodeText.isEmpty ? nil : techCodeText

            case .job:
                return nil
            }
        }

        var parentCode: String? {
            if let code = selectedJobCode?.code, codeType == .tech {
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
