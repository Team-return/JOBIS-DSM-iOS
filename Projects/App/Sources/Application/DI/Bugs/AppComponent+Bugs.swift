import NeedleFoundation
import BugsDomain
import BugsDomainInterface

public extension AppComponent {
    var remoteBugsDataSource: any RemoteBugsDataSource {
        shared {
            RemoteBugsDataSourceImpl(keychain: keychain)
        }
    }

    var bugsRepository: any BugsRepository {
        shared {
            BugsRepositoryImpl(remoteBugsDataSource: remoteBugsDataSource)
        }
    }

    var reportBugsUseCase: any ReportBugsUseCase {
        shared {
            ReportBugsUseCaseImpl(bugsRepository: bugsRepository)
        }
    }
}
