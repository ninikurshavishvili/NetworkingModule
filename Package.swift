// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "NetworkingModule",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "NetworkingModule",
            targets: ["NetworkingModule"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "NetworkingModule",
            path: "NetworkingModule"
        ),
    ]
)



