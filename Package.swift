// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UtilityCoreKit",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UtilityCoreKit",
            targets: ["UtilityCoreKit"]),
    ],
    dependencies: [
//        .package(path: "../FoundationCoreKit") // Local path for development
        // For remote packages, use:
        // .package(url: "https://url", from: "1.0.0")
//            .pack
//        .package(url: "https://github.com/ofiron/FoundationCoreKit", from: "0.0.1")
//        .package(url: "https://github.com/ofiron/FoundationCoreKit", branch: "master")
        .package(url: "https://github.com/ofiron/FoundationCoreKit", exact: "0.0.3")
//        .package(url: "https://github.com/ofiron/FoundationCoreKit", branch: "dev")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "UtilityCoreKit",
            dependencies: ["FoundationCoreKit"]),
        .testTarget(
            name: "UtilityCoreKitTests",
            dependencies: ["UtilityCoreKit"]),
    ]
)
