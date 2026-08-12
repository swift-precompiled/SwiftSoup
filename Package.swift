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
            targets: ["SwiftSoup_PrecompiledProduct"]
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
            url: "https://github.com/swift-precompiled/SwiftSoup/releases/download/2.13.7/SwiftSoup-8d6a4284a994f454124d45c002f050a7cd7e03b90068597a79fa99ab49510785.xcframework.zip",
            checksum: "8d6a4284a994f454124d45c002f050a7cd7e03b90068597a79fa99ab49510785"
        ),
        .executableTarget(
            name: "SwiftSoupProfile",
            dependencies: ["SwiftSoup_Aggregation"],
            path: "Executables/SwiftSoupProfile",
            sources: ["main.swift"],
            swiftSettings: [.unsafeFlags(["-Xfrontend", "-experimental-package-interface-load"])]
        ),
        .target(
            name: "SwiftSoup_PrecompiledProduct",
            dependencies: ["SwiftSoup_Aggregation"]
        )
    ]
)