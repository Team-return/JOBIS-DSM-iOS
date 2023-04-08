import NeedleFoundation
import AuthDomain
import AuthDomainInterface

public extension AppComponent {
    var remoteAuthDataSource: any RemoteAuthDataSource {
        shared {
            RemoteAuthDataSourceImpl(keychain: keychain)
        }
    }

    var authRepository: any AuthRepository {
        shared {
            AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDataSource)
        }
    }

    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        shared {
            SendAuthCodeUseCaseImpl(authRepository: authRepository)
        }
    }

    var reissueTokenUseCase: any ReissueTokenUseCase {
        shared {
            ReissueTokenUseCaseImpl(authRepository: authRepository)
        }
    }
}
