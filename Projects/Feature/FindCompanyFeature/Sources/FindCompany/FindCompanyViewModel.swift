import BaseFeature
import CompaniesDomainInterface
import Combine

final class FindCompanyViewModel: BaseViewModel {
    @Published var listPage: Int = 1
    @Published var studentCompanyList: StudentCompanyListEntity?
    @Published var companyText: String = ""
    @Published var filteringName: String = ""

    private let fetchStudentCompanyListUseCase: FetchStudentCompanyListUseCase

    public init(
        fetchStudentCompanyListUseCase: any FetchStudentCompanyListUseCase
    ) {
        self.fetchStudentCompanyListUseCase = fetchStudentCompanyListUseCase
    }

    func onAppear() {
        self.listPage = 1
        addCancellable(
            fetchStudentCompanyListUseCase.execute(page: listPage, name: companyText)
        ) { [weak self] studentCompanyList in
            self?.studentCompanyList = studentCompanyList
            self?.filteringName = self?.companyText ?? ""
        }
    }

    func appendFindCompanyList(list: CompanyEntity) {
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
