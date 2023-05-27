import NeedleFoundation
import ReviewsDomain
import ReviewsDomainInterface

public extension AppComponent {
    var remoteReviewsDataSource: any RemoteReviewsDataSource {
        shared {
            RemoteReviewsDataSourceImpl(keychain: keychain)
        }
    }

    var reviewsRepository: any ReviewsRepository {
        shared {
            ReviewsRepositoryImpl(remoteReviewsDataSource: remoteReviewsDataSource)
        }
    }

    var fetchReviewDetailUseCase: any FetchReviewDetailUseCase {
        shared {
            FetchReviewDetailUseCaseImpl(reviewsRepository: reviewsRepository)
        }
    }

    var fetchReviewListUseCase: any FetchReviewListUseCase {
        shared {
            FetchReviewListUseCaseImpl(reviewsRepository: reviewsRepository)
        }
    }

    var postReviewUseCase: any PostReviewUseCase {
        shared {
            PostReviewUseCaseImpl(reviewsRepository: reviewsRepository)
        }
    }
}
