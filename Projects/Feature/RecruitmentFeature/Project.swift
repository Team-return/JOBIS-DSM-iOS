import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.RecruitmentFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.FindCompanyFeatureInterface,
        .Domain.ApplicationsDomainInterface,
        .Domain.RecruitmentsDomainInterface,
        .Domain.CodesDomainInterface,
        .Domain.BookmarksDomainInterface,
        .Domain.FilesDomainInterface
    ]
)
