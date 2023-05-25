import NeedleFoundation
import BookmarksDomain
import BookmarksDomainInterface
import JwtStoreInterface

public extension AppComponent {
    var remoteBookmarksDataSource: any RemoteBookmarksDataSource {
        shared {
            RemoteBookmarksDataSourceImpl(keychain: keychain)
        }
    }

    var bookmarksRepository: any BookmarksRepository {
        shared {
            BookmarksRepositoryImpl(remoteBookmarksDataSource: remoteBookmarksDataSource)
        }
    }

    var fetchBookmarkListUseCase: any FetchBookmarkListUseCase {
        shared {
            FetchBookmarkListUseCaseImpl(bookmarksRepository: bookmarksRepository)
        }
    }

    var bookmarkUseCase: any BookmarkUseCase {
        shared {
            BookmarkUseCaseImpl(bookmarksRepository: bookmarksRepository)
        }
    }
}
