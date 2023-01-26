// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", from: "15.0.0"),
    ]
)