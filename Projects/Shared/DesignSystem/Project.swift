import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.DesignSystem.rawValue,
    product: .framework,
    targets: [.demo],
    externalDependencies: [
        .SPM.Kingfisher,
        .Shared.JOBISEnvironment
    ],
    resources: ["Resources/**"],
    additionalPlistRows: [
        "S3_BASE_URL": .string("$(S3_BASE_URL)")
    ]
)
