import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.JOBISEnvironment.rawValue,
    product: .framework,
    targets: [],
    internalDependencies: [],
    additionalPlistRows: [
        "API_BASE_URL": .string("$(API_BASE_URL)"),
        "S3_BASE_URL": .string("$(S3_BASE_URL)")
    ]
)
