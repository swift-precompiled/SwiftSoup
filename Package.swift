// swift-tools-version:6.0.0

import PackageDescription
import Foundation

let package = Package(
    name: "SwiftSoup",
    platforms: [
        .macOS("10.15"),
        .iOS("13.0"),
        .tvOS("13.0"),
        .watchOS("6.0")
    ],
    products: [
        .library(
            name: "SwiftSoup",
            targets: ["SwiftSoup"]
        ),
        .executable(
            name: "SwiftSoupProfile",
            targets: ["SwiftSoupProfile"]
        )
    ],
    targets: [
        .target(
            name: "SwiftSoup_Aggregation",
            dependencies: ["SwiftSoup"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "SwiftSoup",
            url: "https://github.com/swift-precompiled/SwiftSoup/releases/download/2.13.7/SwiftSoup-7e8130a61079d7b8d39c35653e0e762d147bd8a76c899de29237c3938114b5cc.xcframework.zip",
            checksum: "7e8130a61079d7b8d39c35653e0e762d147bd8a76c899de29237c3938114b5cc"
        ),
        .executableTarget(
            name: "SwiftSoupProfile",
            dependencies: ["SwiftSoup_Aggregation"],
            path: "Executables/SwiftSoupProfile",
            sources: ["main.swift"],
            swiftSettings: [.unsafeFlags(["-Xfrontend", "-experimental-package-interface-load"])]
        )
    ]
)