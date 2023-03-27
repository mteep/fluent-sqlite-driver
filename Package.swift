// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "fluent-sqlite-driver",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "FluentSQLiteDriver", targets: ["FluentSQLiteDriver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mteep/fluent-kit.git", branch: "xcode-on-big-sur"),
        .package(url: "https://github.com/mteep/sqlite-kit.git", branch: "xcode-on-big-sur"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "FluentSQLiteDriver", dependencies: [
            .product(name: "FluentKit", package: "fluent-kit"),
            .product(name: "FluentSQL", package: "fluent-kit"),
            .product(name: "Logging", package: "swift-log"),
            .product(name: "SQLiteKit", package: "sqlite-kit"),
        ]),
        .testTarget(name: "FluentSQLiteDriverTests", dependencies: [
            .product(name: "FluentBenchmark", package: "fluent-kit"),
            .target(name: "FluentSQLiteDriver"),
        ]),
    ]
)
