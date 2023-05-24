import BaseFeature
import CompaniesDomainInterface
import Combine

final class FindWorkSpaceViewModel: BaseViewModel {
    @Published var studentCompany: StudentCompanyEntity?

    private let fetchStudentCompanyListUseCase: FetchStudentCompanyListUseCase

    public init(fetchStudentCompanyListUseCase: any FetchStudentCompanyListUseCase) {
        self.fetchStudentCompanyListUseCase = fetchStudentCompanyListUseCase
    }

    func onAppear() {
        addCancellable(
            fetchStudentCompanyListUseCase.execute()
        ) { [weak self] studentCompany in
            self?.studentCompany = studentCompany
        }
    }
}
