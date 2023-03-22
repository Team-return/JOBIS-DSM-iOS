import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.RootFeature.rawValue,
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.SplashFeature,
        .Feature.MainTabFeature
    ]
)
