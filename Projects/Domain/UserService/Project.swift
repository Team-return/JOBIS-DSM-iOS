import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.UserDomain.rawValue,
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Shared.GlobalThirdPartyLibrary,
        .Shared.KeychainModule,
        .Shared.ErrorModule,
//        .Project.Service.DataMappingModule,

        .SPM.Moya,
        .SPM.CombineMoya
    ]
)
