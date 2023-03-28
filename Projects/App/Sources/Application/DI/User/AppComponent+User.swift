import NeedleFoundation
import UserDomain
import UserDomainInterface
import JwtStoreInterface

public extension AppComponent {
    var localUserDataSource: any LocalUserDataSource {
        shared {
            LocalUserDataSourceImpl(keychain: keychain)
        }
    }

    var remoteUserDataSource: any RemoteUserDataSource {
        shared {
            RemoteUserDataSourceImpl(keychain: keychain)
        }
    }

    var localUserRepository: any LocalUserRepository {
        shared {
            LocalUserRepositoryImpl(localUserDataSource: localUserDataSource)
        }
    }

    var userRepository: any UserRepository {
        shared {
            UserRepositoryImpl(remoteUserDataSource: remoteUserDataSource)
        }
    }

    var loadJwtTokenUseCase: any LoadJwtTokenUseCase {
        shared {
            LoadJwtTokenUseCaseImpl(localUserRepository: localUserRepository)
        }
    }

    var reissueTokenUseCase: any ReissueTokenUseCase {
        shared {
            ReissueTokenUseCaseImpl(userRepository: userRepository)
        }
    }

    var signinUseCase: any SigninUseCase {
        shared {
            SigninUseCaseImpl(userRepository: userRepository)
        }
    }
}
