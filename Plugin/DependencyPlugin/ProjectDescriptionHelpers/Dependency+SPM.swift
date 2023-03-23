import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Quick = TargetDependency.external(name: "Quick")
    static let Nimble = TargetDependency.external(name: "Nimble")
    static let Needle = TargetDependency.external(name: "NeedleFoundation")
    static let Emdpoint = TargetDependency.external(name: "Emdpoint")
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
    static let Swinject = TargetDependency.external(name: "Swinject")
}

public extension Package {
}
