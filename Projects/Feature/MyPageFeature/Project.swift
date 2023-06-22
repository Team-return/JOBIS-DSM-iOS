import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.MyPageFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Domain.AuthDomainInterface,
        .Domain.StudentsDomainInterface,
        .Domain.BugsDomainInterface,
        .Domain.FilesDomainInterface
    ]
)
