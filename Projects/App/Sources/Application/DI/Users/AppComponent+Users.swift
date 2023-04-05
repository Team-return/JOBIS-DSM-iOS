import NeedleFoundation
import UsersDomain
import UsersDomainInterface
import JwtStoreInterface

public extension AppComponent {
    var localUsersDataSource: any LocalUsersDataSource {
        shared {
            LocalUsersDataSourceImpl(keychain: keychain)
        }
    }

    var remoteUsersDataSource: any RemoteUsersDataSource {
        shared {
            RemoteUsersDataSourceImpl(keychain: keychain)
        }
    }

    var localUsersRepository: any LocalUsersRepository {
        shared {
            LocalUsersRepositoryImpl(localUsersDataSource: localUsersDataSource)
        }
    }

    var usersRepository: any UsersRepository {
        shared {
            UsersRepositoryImpl(remoteUsersDataSource: remoteUsersDataSource)
        }
    }

    var loadJwtTokenUseCase: any LoadJwtTokenUseCase {
        shared {
            LoadJwtTokenUseCaseImpl(localUsersRepository: localUsersRepository)
        }
    }

    var reissueTokenUseCase: any ReissueTokenUseCase {
        shared {
            ReissueTokenUseCaseImpl(usersRepository: usersRepository)
        }
    }

    var signinUseCase: any SigninUseCase {
        shared {
            SigninUseCaseImpl(usersRepository: usersRepository)
        }
    }
}
