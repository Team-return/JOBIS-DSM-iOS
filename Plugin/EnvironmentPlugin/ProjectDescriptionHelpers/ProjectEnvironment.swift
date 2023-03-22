import ProjectDescription

public struct ProjectEnvironment {
    public let name: String
    public let organizationName: String
    public let deploymentTarget: DeploymentTarget
    public let platform: Platform
    public let baseSetting: SettingsDictionary
}

public let env = ProjectEnvironment(
    name: "JOBIS-DSM-iOS",
    organizationName: "Team-Return",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
    platform: .iOS,
    baseSetting: [:]
)