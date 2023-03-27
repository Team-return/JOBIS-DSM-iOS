import NeedleFoundation
import CodeDomain
import CodeDomainInterface

public extension AppComponent {
    var remoteCodeDataSource: any RemoteCodeDataSource {
        shared {
            RemoteCodeDataSourceImpl(keychain: keychain)
        }
    }

    var codeRepository: any CodeRepository {
        shared {
            CodeRepositoryImpl(remoteCodeDataSource: remoteCodeDataSource)
        }
    }

    var fetchJobCodeUseCase: any FetchJobCodeUseCase {
        shared {
            FetchJobCodeUseCaseImpl(codeRepository: codeRepository)
        }
    }

    var fetchTechCodeUseCase: any FetchTechCodeUseCase {
        shared {
            FetchTechCodeUseCaseImpl(codeRepository: codeRepository)
        }
    }
}
