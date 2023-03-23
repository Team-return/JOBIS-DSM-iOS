// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "5.0.1"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "10.0.0"),
        .package(url: "https://github.com/uber/needle.git", from: "0.19.0"),
        .package(url: "https://github.com/GSM-MSG/Emdpoint.git", exact: "3.2.2"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0"),
        .package(url: "https://github.com/Swinject/Swinject.git", exact: "2.8.3"),
    ]
)