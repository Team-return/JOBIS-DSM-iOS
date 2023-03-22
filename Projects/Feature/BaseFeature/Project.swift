import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
//    name: "BaseFeature",
//    product: .staticFramework,
//    dependencies: [
//        .Service.Domain,
//        .Module.Utility,
//        .Module.FeatureThirdPartyLib,
//        .UserInterfaces.DesignSystem
//    ]
    name: ModulePaths.Feature.BaseFeature.rawValue,
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Core.DesignSystem,
        .Shared.GlobalThirdPartyLibrary,
        .Shared.UtilityModule
    ]
)
