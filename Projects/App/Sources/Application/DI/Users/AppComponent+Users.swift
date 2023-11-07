import NeedleFoundation
import UsersDomain
import UsersDomainInterface
import JwtStoreInterface

public extension AppComponent {
    var remoteUsersDataSource: any RemoteUsersDataSource {
        shared {
            RemoteUsersDataSourceImpl(keychain: keychain)
        }
    }

    var usersRepository: any UsersRepository {
        shared {
            UsersRepositoryImpl(remoteUsersDataSource: remoteUsersDataSource)
        }
    }

    var signinUseCase: any SigninUseCase {
        shared {
            SigninUseCaseImpl(usersRepository: usersRepository)
        }
    }

    var fetchMarketVersionUseCase: any FetchMarketVersionUseCase {
        shared {
            FetchMarketVersionUseCaseImpl(usersRepository: usersRepository)
        }
    }
}
