// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VIDVOrchestrator",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "VIDVOrchestrator",
            targets: ["VIDVOrchestrator"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "VIDVOrchestrator",
            url: "https://valify-public-sdks.s3.eu-central-1.amazonaws.com/VIDVOrchestrator/1.0.0/VIDVOrchestrator.zip",
            checksum: "28439acba7569b63b054d381099324d7d361ffea6e850f840fac8224bc082947"
        )
    ]
)
