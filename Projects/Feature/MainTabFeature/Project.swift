import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.MainTabFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.HomeFeatureInterface,
        .Feature.BookmarkListFeatureInterface,
        .Feature.MenuFeatureInterface,
        .Feature.MyPageFeatureInterface
    ]
)
