// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "hummingbird-services",
    platforms: [
       .macOS(.v12),
    ],
    products: [
        .library(name: "HummingbirdServices", targets: ["HummingbirdServices"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/hummingbird-project/hummingbird.git",
            from: "1.6.0"
        ),
    ],
    targets: [
        .target(name: "HummingbirdServices", dependencies: [
            .product(name: "Hummingbird", package: "hummingbird"),
        ]),
        .testTarget(name: "HummingbirdServicesTests", dependencies: [
            .target(name: "HummingbirdServices"),
        ]),
    ]
)
