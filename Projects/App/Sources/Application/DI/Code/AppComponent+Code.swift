import NeedleFoundation
import CodesDomain
import CodesDomainInterface

public extension AppComponent {
    var remoteCodesDataSource: any RemoteCodesDataSource {
        shared {
            RemoteCodesDataSourceImpl(keychain: keychain)
        }
    }

    var codesRepository: any CodesRepository {
        shared {
            CodesRepositoryImpl(remoteCodesDataSource: remoteCodesDataSource)
        }
    }

    var fetchCodesUseCase: any FetchCodesUseCase {
        shared {
            FetchCodesUseCaseImpl(codesRepository: codesRepository)
        }
    }
}
