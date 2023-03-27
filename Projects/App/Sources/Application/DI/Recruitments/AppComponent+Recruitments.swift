import NeedleFoundation
import RecruitmentsDomain
import RecruitmentsDomainInterface

public extension AppComponent {
    var remoteRecruitmentsDataSource: any RemoteRecruitmentsDataSource {
        shared {
            RemoteRecruitmentsDataSourceImpl(keychain: keychain)
        }
    }

    var recruitmentsRepository: any RecruitmentsRepository {
        shared {
            RecruitmentsRepositoryImpl(remoteRecruitmentsDataSource: remoteRecruitmentsDataSource)
        }
    }

    var fetchRecruitmentDetailUseCase: any FetchRecruitmentDetailUseCase {
        shared {
            FetchRecruitmentDetailUseCaseImpl(recruitmentsRepository: recruitmentsRepository)
        }
    }

    var fetchRecruitmentListUseCase: any FetchRecruitmentListUseCase {
        shared {
            FetchRecruitmentListUseCaseImpl(recruitmentsRepository: recruitmentsRepository)
        }
    }
}
