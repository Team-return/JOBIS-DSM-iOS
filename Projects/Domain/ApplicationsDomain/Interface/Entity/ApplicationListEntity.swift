import Foundation

public struct ApplicationListEntity: Equatable {
    public let applications: [ApplicationEntity]

    public init(applications: [ApplicationEntity]) {
        self.applications = applications
    }
}
