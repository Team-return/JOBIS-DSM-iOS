import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Feature",
    product: .staticFramework,
    dependencies: [
        .project(target: "Service", path: .relativeToRoot("Projects/Service"))
    ],
    resources: ["Resources/**"]
)
