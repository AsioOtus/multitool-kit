// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "multitool-kit",
  products: [
    .library(
        name: "MultitoolKitEcho",
        targets: [
            "MultitoolEcho",
        ]
    ),
    .library(
        name: "MultitoolKitFluent",
        targets: [
            "MultitoolFluent",
        ]
    ),
    .library(
        name: "MultitoolKitFormatters",
        targets: [
            "MultitoolFormatters",
        ]
    ),
    .library(
        name: "MultitoolKitValueProcessing",
        targets: [
            "MultitoolValueProcessing",
        ]
    ),
    .library(
        name: "MultitoolKitTree",
        targets: [
            "MultitoolTree",
        ]
    ),
  ],
  targets: [
    .target(
      name: "MultitoolEcho",
      path: "Sources/Core/Echo"
    ),
    .target(
      name: "MultitoolFluent",
      path: "Sources/Core/Fluent"
    ),
    .target(
      name: "MultitoolFormatters",
      path: "Sources/Core/Formatters"
    ),
    .target(
      name: "MultitoolValueProcessing",
      path: "Sources/Core/ValueProcessing"
    ),
    .target(
      name: "MultitoolTree",
      path: "Sources/Core/Tree"
    ),
    .executableTarget(
      name: "Testground",
      dependencies: [
        "MultitoolDispatch",
        "MultitoolEcho",
        "MultitoolFluent",
        "MultitoolFormatters",
        "MultitoolValueProcessing",
        "MultitoolTree",
      ]
    )
  ]
)
