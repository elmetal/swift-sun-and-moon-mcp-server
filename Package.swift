// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-sun-and-moon-mcp-server",
    platforms: [.macOS(.v15)],
    dependencies: [
        .package(url: "https://github.com/loopwork-ai/mcp-swift-sdk", from: "0.6.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "swift-sun-and-moon-mcp-server",
            dependencies: [
                .product(name: "MCP", package: "mcp-swift-sdk"),
            ]
        ),
    ]
)
