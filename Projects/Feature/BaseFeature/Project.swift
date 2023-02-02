import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "BaseFeature",
    product: .staticFramework,
    dependencies: [
//        .Project.Service.Domain,
//        .Project.Module.Utility,
        .Project.Module.ThirdPartyLib,
        .Project.UserInterfaces.DesignSystem
    ]
)
