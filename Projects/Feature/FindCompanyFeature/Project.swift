import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.FindCompanyFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.RecruitmentFeatureInterface,
        .Domain.CompaniesDomainInterface,
        .Domain.ReviewsDomainInterface
    ]
)
