// swift-tools-version:5.5
import PackageDescription

// Legacy VIDVOrchestrator (0.1.0). Module: VIDVIdentityKit — `import VIDVIdentityKit`.
let package = Package(
    name: "VIDVOrchestrator",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "VIDVOrchestrator",
            targets: ["VIDVIdentityKit", "VIDVOrchestratorDependencies"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Valify-Solutions/VIDVLiveness-SPM.git", .exact("4.1.9")),
        .package(url: "https://github.com/Valify-Solutions/VIDVDocKit-SPM.git", .exact("1.7.3")),
        .package(url: "https://github.com/Valify-Solutions/VIDVOtp-SPM.git", .exact("1.0.14")),
    ],
    targets: [
        .binaryTarget(
            name: "VIDVIdentityKit",
            url: "https://valify-public-sdks.s3.eu-central-1.amazonaws.com/VIDVOrchestrator/0.1.0/VIDVIdentityKit.zip",
            checksum: "98ae4d1d40191205ae0020583ebac614e7874e405618cd0ad3305ee611fa48af"
        ),
        .target(
            name: "VIDVOrchestratorDependencies",
            dependencies: [
                .target(name: "VIDVIdentityKit"),
                .product(name: "VIDVLiveness", package: "VIDVLiveness-SPM"),
                .product(name: "VIDVDocKit", package: "VIDVDocKit-SPM"),
                .product(name: "VIDVOTP", package: "VIDVOtp-SPM"),
            ]
        )
    ]
)
