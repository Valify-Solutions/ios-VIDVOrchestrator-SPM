// swift-tools-version:5.5
import PackageDescription

// Legacy VIDVOrchestrator (0.2.1). Module: VIDVOrchestrator — `import VIDVOrchestrator`.
let package = Package(
    name: "VIDVOrchestrator",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "VIDVOrchestrator",
            targets: ["VIDVOrchestrator", "VIDVOrchestratorDependencies"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Valify-Solutions/VIDVLiveness-SPM.git", .exact("4.1.9")),
        .package(url: "https://github.com/Valify-Solutions/VIDVDocKit-SPM.git", .exact("1.7.5")),
        .package(url: "https://github.com/Valify-Solutions/VIDVOtp-SPM.git", .exact("1.0.14")),
    ],
    targets: [
        .binaryTarget(
            name: "VIDVOrchestrator",
            url: "https://valify-public-sdks.s3.eu-central-1.amazonaws.com/VIDVOrchestrator/0.2.0/VIDVOrchestrator.zip",
            checksum: "97ef72f2966e18020c301a4a2810ba240eb21fb32de66d20746a18cd880f7662"
        ),
        .target(
            name: "VIDVOrchestratorDependencies",
            dependencies: [
                .target(name: "VIDVOrchestrator"),
                .product(name: "VIDVLiveness", package: "VIDVLiveness-SPM"),
                .product(name: "VIDVDocKit", package: "VIDVDocKit-SPM"),
                .product(name: "VIDVOTP", package: "VIDVOtp-SPM"),
            ]
        )
    ]
)
