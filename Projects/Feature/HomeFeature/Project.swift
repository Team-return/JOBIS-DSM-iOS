import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.HomeFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.FindCompanyFeatureInterface,
        .Feature.RecruitmentFeatureInterface,
        .Domain.ApplicationsDomainInterface,
        .Domain.StudentsDomainInterface,
        .Domain.RecruitmentsDomainInterface,
        .Domain.BookmarksDomainInterface
    ]
)
