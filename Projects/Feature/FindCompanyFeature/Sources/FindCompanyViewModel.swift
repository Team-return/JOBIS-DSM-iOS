import BaseFeature
import CompaniesDomainInterface
import Combine

final class FindCompanyViewModel: BaseViewModel {
    @Published var listPage: Int = 1
    @Published var studentCompanyList: StudentCompanyListEntity?
    @Published var isNavigateCompanyDetail: Bool = false

    private let fetchStudentCompanyListUseCase: FetchStudentCompanyListUseCase

    public init(
        fetchStudentCompanyListUseCase: any FetchStudentCompanyListUseCase
    ) {
        self.fetchStudentCompanyListUseCase = fetchStudentCompanyListUseCase
    }

    func onAppear() {
        self.listPage = 1
        addCancellable(
            fetchStudentCompanyListUseCase.execute(page: listPage, name: nil)
        ) { [weak self] studentCompanyList in
            self?.studentCompanyList = studentCompanyList
        }
    }

    func appendFindWorkSpaceList(list: CompanyEntity) {
        if self.studentCompanyList?.companies.last == list {
            listPage += 1
            addCancellable(
                fetchStudentCompanyListUseCase.execute(page: listPage, name: nil)
            ) { [weak self] studentCompanyList in
                self?.studentCompanyList?.companies.append(contentsOf: studentCompanyList.companies)
            }
        }
    }
}
