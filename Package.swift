// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "multitool-kit",
  products: [
    .library(
      name: "MultitoolKit",
      targets: [
        "MultitoolDispatch",
        "MultitoolEcho",
        "MultitoolFluent",
        "MultitoolFormatters",
        "MultitoolValueProcessing",
        "MultitoolTree",
      ]
    )
  ],
  targets: [
    .target(
      name: "MultitoolDispatch",
      path: "Sources/Core/Dispatch"
    ),
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
