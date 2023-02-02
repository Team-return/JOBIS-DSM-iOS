import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "Service",
    product: .staticFramework,
    dependencies: [
        .Project.Module.ThirdPartyLib
    ]
)
