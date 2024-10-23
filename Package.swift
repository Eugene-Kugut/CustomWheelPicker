// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CustomWheelPicker",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "CustomWheelPicker",
            targets: ["CustomWheelPicker"]),
    ],
    targets: [
        .target(
            name: "CustomWheelPicker",
            swiftSettings: [.swiftLanguageMode(.v5)]
        )
    ]
)
