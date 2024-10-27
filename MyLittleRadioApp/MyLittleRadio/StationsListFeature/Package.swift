// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StationsListFeature",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "StationsListFeature",
            targets: ["StationsListFeature"]
        )
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(name: "StationDetailsFeature", path: "../StationDetailsFeature"),
        .package(name: "MyLittleDesignSystem", path: "../MyLittleDesignSystem"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.15.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "StationsListFeature",
            dependencies: [
                .product(name: "Domain",
                         package: "Domain"),
                .product(name: "StationDetailsFeature",
                         package: "StationDetailsFeature"),
                .product(name: "MyLittleDesignSystem",
                         package: "MyLittleDesignSystem"),
                .product(name: "ComposableArchitecture",
                         package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "StationsListFeatureTests",
            dependencies: ["StationsListFeature"]
        )
    ]
)
