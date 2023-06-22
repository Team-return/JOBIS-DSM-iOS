import NeedleFoundation
import FilesDomain
import FilesDomainInterface

public extension AppComponent {
    var remoteFilesDataSource: any RemoteFilesDataSource {
        shared {
            RemoteFilesDataSourceImpl(keychain: keychain)
        }
    }

    var filesRepository: any FilesRepository {
        shared {
            FilesRepositoryImpl(remoteFilesDataSource: remoteFilesDataSource)
        }
    }

    var uploadFilesUseCase: any UploadFilesUseCase {
        shared {
            UploadFilesUseCaseImpl(filesRepository: filesRepository)
        }
    }
}
