import ProjectDescriptionHelpers
import ProjectDescription
import DependencyPlugin
import EnvironmentPlugin
import Foundation

let isCI: Bool = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1"

let configurations: [Configuration] = [
    .debug(name: .dev, xcconfig: .relativeToXCConfig(type: .dev, name: env.targetName)),
    .debug(name: .stage, xcconfig: .relativeToXCConfig(type: .stage, name: env.targetName)),
    .release(name: .prod, xcconfig: .relativeToXCConfig(type: .prod, name: env.targetName))
]

let settings: Settings =
    .settings(base: env.baseSetting,
              configurations: configurations,
              defaultSettings: .recommended)

let scripts: [TargetScript] = isCI ? [] : [.swiftLint, .needle]

let targets: [Target] = [
    .init(
        name: env.targetName,
        platform: env.platform,
        product: .app,
        bundleId: "$(APP_BUNDLE_ID)",
        deploymentTarget: env.deploymentTarget,
        infoPlist: .file(path: "Support/Info.plist"),
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        entitlements: "Support/\(env.appName).entitlements",
        scripts: scripts,
        dependencies: [
            .Core.JwtStore,
            .Core.JwtStoreInterface,
            .Feature.RootFeature,
            .Feature.BookmarkListFeature,
            .Feature.SigninFeature,
            .Feature.SignupFeature,
            .Feature.MainTabFeature,
            .Feature.HomeFeature,
            .Feature.FindCompanyFeature,
            .Feature.RecruitmentFeature,
            .Feature.MyPageFeature,
            .Feature.MenuFeature,
            .Feature.SplashFeature,
            .Feature.RenewalPasswordFeature,
            .Feature.BugFeature,
            .Feature.PostReviewFeature,
            .Domain.UsersDomain,
            .Domain.AuthDomain,
            .Domain.RecruitmentsDomain,
            .Domain.ApplicationsDomain,
            .Domain.CodesDomain,
            .Domain.CompaniesDomain,
            .Domain.BookmarksDomain,
            .Domain.ReviewsDomain,
            .Domain.FilesDomain,
            .Domain.BugsDomain,
            .SPM.Needle
        ],
        settings: .settings(base: env.baseSetting)
    ),
    .init(
        name: env.targetTestName,
        platform: .iOS,
        product: .unitTests,
        bundleId: "\(env.organizationName).\(env.targetName)Tests",
        deploymentTarget: env.deploymentTarget,
        infoPlist: .default,
        sources: ["Tests/**"],
        dependencies: [
            .target(name: env.targetName)
        ]
    )
]

let schemes: [Scheme] = [
    .init(
      name: "\(env.targetName)-DEV",
      shared: true,
      buildAction: .buildAction(targets: ["\(env.targetName)"]),
      testAction: TestAction.targets(
          ["\(env.targetTestName)"],
          configuration: .dev,
          options: TestActionOptions.options(
              coverage: true,
              codeCoverageTargets: ["\(env.targetName)"]
          )
      ),
      runAction: .runAction(configuration: .dev),
      archiveAction: .archiveAction(configuration: .dev),
      profileAction: .profileAction(configuration: .dev),
      analyzeAction: .analyzeAction(configuration: .dev)
    ),
    .init(
      name: "\(env.targetName)-PROD",
      shared: true,
      buildAction: BuildAction(targets: ["\(env.targetName)"]),
      testAction: nil,
      runAction: .runAction(configuration: .prod),
      archiveAction: .archiveAction(configuration: .prod),
      profileAction: .profileAction(configuration: .prod),
      analyzeAction: .analyzeAction(configuration: .prod)
    ),
    .init(
      name: "\(env.targetName)-STAGE",
      shared: true,
      buildAction: BuildAction(targets: ["\(env.targetName)"]),
      testAction: nil,
      runAction: .runAction(configuration: .stage),
      archiveAction: .archiveAction(configuration: .stage),
      profileAction: .profileAction(configuration: .stage),
      analyzeAction: .analyzeAction(configuration: .stage)
    )
]

let project = Project(
    name: env.targetName,
    organizationName: env.organizationName,
    settings: settings,
    targets: targets,
    schemes: schemes
)
