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
        .package(url: "https://github.com/Valify-Solutions/ios-VIDVBiometrics-SPM.git", .exact("1.0.4")),
        .package(url: "https://github.com/Valify-Solutions/VIDVDocKit-SPM.git", .exact("1.7.3")),
        .package(url: "https://github.com/Valify-Solutions/VIDVOtp-SPM.git", .exact("1.0.14")),
    ],
    targets: [
        .binaryTarget(
            name: "VIDVOrchestrator",
            url: "https://valify-public-sdks.s3.eu-central-1.amazonaws.com/VIDVOrchestrator/1.1.0/VIDVOrchestrator.zip",
            checksum: "ad0b58b37282036c464472028ca3df5c64532e5822e53b96ff33d0348d40d8cd"
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
