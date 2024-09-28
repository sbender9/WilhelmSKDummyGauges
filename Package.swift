// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WilhelmSKDummyGauges",
    platforms: [
      .iOS(.v13), .tvOS(.v13), .watchOS(.v8)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "WilhelmSKDummyGauges",
            targets: ["WilhelmSKDummyGauges"]),
    ],
    dependencies: [
      //.package(path: "../WilhelmSKLibrary"),
      .package(url: "https://github.com/sbender9/WilhelmSKLibrary", .upToNextMajor(from: "0.0.5")),
    ],

    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "WilhelmSKDummyGauges",
            dependencies: ["WilhelmSKLibrary"]),
        .testTarget(
            name: "WilhelmSKDummyGaugesTests",
            dependencies: ["WilhelmSKDummyGauges"]
        ),
    ]
)
