import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.MyPageFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.BugFeatureInterface,
        .Feature.PostReviewFeatureInterface,
        .Domain.AuthDomainInterface,
        .Domain.StudentsDomainInterface,
        .Domain.FilesDomainInterface,
        .Domain.CompaniesDomainInterface
    ]
)
