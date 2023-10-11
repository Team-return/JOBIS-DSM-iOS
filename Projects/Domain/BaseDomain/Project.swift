import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    product: .framework,
    targets: [.unitTest],
    externalDependencies: [
        .SPM.Moya,
        .SPM.CombineMoya
    ],
    internalDependencies: [
        .Core.JwtStoreInterface,
        .Shared.GlobalThirdPartyLibrary,
        .Shared.UtilityModule,
    ]
)
