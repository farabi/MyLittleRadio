// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StationDetailsFeature",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "StationDetailsFeature",
            targets: ["StationDetailsFeature"]
        )
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(name: "MyLittlePlayer", path: "../MyLittlePlayer"),
        .package(name: "MyLittleDesignSystem", path: "../MyLittleDesignSystem"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.15.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "StationDetailsFeature",
            dependencies: [
                .product(name: "Domain",
                         package: "Domain"),
                .product(name: "MyLittlePlayer",
                         package: "MyLittlePlayer"),
                .product(name: "MyLittleDesignSystem",
                         package: "MyLittleDesignSystem"),
                .product(name: "ComposableArchitecture",
                         package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "StationDetailsFeatureTests",
            dependencies: ["StationDetailsFeature"]
        )
    ]
)
