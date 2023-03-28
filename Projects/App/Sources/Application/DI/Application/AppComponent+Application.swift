import NeedleFoundation
import ApplicationsDomain
import ApplicationsDomainInterface

public extension AppComponent {
    var remoteApplicationsDataSource: any RemoteApplicationsDataSource {
        shared {
            RemoteApplicationsDataSourceImpl(keychain: keychain)
        }
    }

    var applicationsRepository: any ApplicationsRepository {
        shared {
            ApplicationsRepositoryImpl(remoteApplicationsDataSource: remoteApplicationsDataSource)
        }
    }

    var applyCompanyUseCase: any ApplyCompanyUseCase {
        shared {
            ApplyCompanyUseCaseImpl(applicationRepository: applicationsRepository)
        }
    }

    var cancelApplyUseCase: any CancelApplyUseCase {
        shared {
            CancelApplyUseCaseImpl(applicationRepository: applicationsRepository)
        }
    }

    var fetchApplicationUseCase: any FetchApplicationUseCase {
        shared {
            FetchApplicationUseCaseImpl(applicationRepository: applicationsRepository)
        }
    }
}
