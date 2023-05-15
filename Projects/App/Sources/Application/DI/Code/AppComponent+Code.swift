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

    var fetchJobCodeUseCase: any FetchJobCodeUseCase {
        shared {
            FetchJobCodeUseCaseImpl(codesRepository: codesRepository)
        }
    }

    var fetchTechCodeUseCase: any FetchTechCodeUseCase {
        shared {
            FetchTechCodeUseCaseImpl(codesRepository: codesRepository)
        }
    }
}
