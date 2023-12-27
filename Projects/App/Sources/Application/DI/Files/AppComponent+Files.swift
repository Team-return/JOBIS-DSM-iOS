import NeedleFoundation
import FilesDomain
import FilesDomainInterface

public extension AppComponent {
    var remoteFilesDataSource: any RemoteFilesDataSource {
        shared {
            RemoteFilesDataSourceImpl(keychain: keychain)
        }
    }

    var remotePresignedURLDataSource: any RemotePresignedURLDataSource {
        shared {
            RemotePresignedURLDataSourceImpl(keychain: keychain)
        }
    }

    var filesRepository: any FilesRepository {
        shared {
            FilesRepositoryImpl(remoteFilesDataSource: remoteFilesDataSource)
        }
    }

    var presignedURLRepository: any PresignedURLRepository {
        shared {
            PresignedURLRepositoryImpl(remotePresignedURLDataSource: remotePresignedURLDataSource)
        }
    }

    var uploadFilesUseCase: any UploadFilesUseCase {
        shared {
            UploadFilesUseCaseImpl(
                filesRepository: filesRepository,
                presignedURLRepository: presignedURLRepository
            )
        }
    }
}
