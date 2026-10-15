// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "APSSPMediationAdMob",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "APSSPMediationAdMob", targets: ["APSSPMediationAdMob"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IGAWorksDev/ap-APSSPSDK-SPM.git", from: "3.4.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.10.0"),
    ],
    targets: [
        .target(name: "APSSPMediationAdMob",
                dependencies: [
                    .product(name: "APSSPSDK", package: "ap-APSSPSDK-SPM"),
                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                ],
                path: "Sources/MediationAdMob"),
    ]
)
