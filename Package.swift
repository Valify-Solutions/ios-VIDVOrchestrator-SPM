// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "VIDVOrchestrator",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "VIDVOrchestrator",
            targets: ["VIDVOrchestrator", "VIDVOrchestratorDependencies"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Valify-Solutions/ios-VIDVBiometrics-SPM.git", .exact("1.1.0")),
        .package(url: "https://github.com/Valify-Solutions/VIDVDocKit-SPM.git", .exact("2.1.0")),
        .package(url: "https://github.com/Valify-Solutions/VIDVOtp-SPM.git", .exact("1.1.0")),
    ],
    targets: [
        .binaryTarget(
            name: "VIDVOrchestrator",
            url: "https://valify-public-sdks.s3.eu-central-1.amazonaws.com/VIDVOrchestrator/1.2.0/VIDVOrchestrator.zip",
            checksum: "6843a119ed58c5a34aff6d9815899c61710017a4b3eb3a37ba4e2051984011ac"
        ),
        .target(
            name: "VIDVOrchestratorDependencies",
            dependencies: [
                .target(name: "VIDVOrchestrator"),
                .product(name: "VIDVBiometrics", package: "ios-VIDVBiometrics-SPM"),
                .product(name: "VIDVDocKit", package: "VIDVDocKit-SPM"),
                .product(name: "VIDVOTP", package: "VIDVOtp-SPM"),
            ]
        )
    ]
)
