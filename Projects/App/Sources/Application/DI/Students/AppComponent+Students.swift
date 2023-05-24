import NeedleFoundation
import StudentsDomain
import StudentsDomainInterface

public extension AppComponent {
    var remoteStudentsDataSource: any RemoteStudentsDataSource {
        shared {
            RemoteStudentsDataSourceImpl(keychain: keychain)
        }
    }

    var studentsRepository: any StudentsRepository {
        shared {
            StudentsRepositoryImpl(remoteStudentsDataSource: remoteStudentsDataSource)
        }
    }

    var renewalPasswordUseCase: any RenewalPasswordUseCase {
        shared {
            RenewalPasswordUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var signupUseCase: any SignupUseCase {
        shared {
            SignupUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var studentExistsUseCase: any StudentExistsUseCase {
        shared {
            StudentExistsUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var fetchStudentInfoUseCase: any FetchStudentInfoUseCase {
        shared {
            FetchStudentInfoUseCaseImpl(studentsRepository: studentsRepository)
        }
    }
}
