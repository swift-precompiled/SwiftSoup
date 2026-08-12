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
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "SwiftSoup",
            url: "https://github.com/swift-precompiled/SwiftSoup/releases/download/2.13.7/SwiftSoup-98d38008fa42d8e7f35e5388fb84f7c76320a62cb20e715084ced1d50fa70e78.xcframework.zip",
            checksum: "98d38008fa42d8e7f35e5388fb84f7c76320a62cb20e715084ced1d50fa70e78"
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