import NeedleFoundation
import CompaniesDomain
import CompaniesDomainInterface

public extension AppComponent {
    var remoteCompaniesDataSource: any RemoteCompaniesDataSource {
        shared {
            RemoteCompaniesDataSourceImpl(keychain: keychain)
        }
    }

    var companiesRepository: any CompaniesRepository {
        shared {
            CompaniesRepositoryImpl(remoteCompaniesDataSource: remoteCompaniesDataSource)
        }
    }

    var fetchCompanyInfoDetailUseCase: any FetchCompanyInfoDetailUseCase {
        shared {
            FetchCompanyInfoDetailUseCaseImpl(companiesRepository: companiesRepository)
        }
    }

    var fetchStudentCompanyListUseCase: any FetchStudentCompanyListUseCase {
        shared {
            FetchStudentCompanyListUseCaseImpl(companiesRepository: companiesRepository)
        }
    }
}
