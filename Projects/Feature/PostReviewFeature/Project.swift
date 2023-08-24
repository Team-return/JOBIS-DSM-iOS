import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.PostReviewFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Domain.ReviewsDomainInterface
    ]
)
