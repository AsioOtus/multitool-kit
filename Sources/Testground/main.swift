import MultitoolTree
import Foundation

extension String: Identifiable {
  public var id: Self{ self }
}

struct Model: Identifiable, Codable {
  let id: Int
  let value: String
}

if #available(macOS 10.15, *) {
  let tree = Tree<Model, StandardTreeNode<Model, Model>>.node(
    .init(
      details: .init(id: 1, value: "AAA"),
      trees: [
        .leaf(.init(id: 11, value: "BBB")),
        .node(
          .init(
            details: .init(id: 111, value: "CCC"),
            trees: [
              .leaf(.init(id: 1111, value: "DDD")),
              .leaf(.init(id: 1112, value: "EEE")),
            ]
          )
        ),
        .leaf(.init(id: 12, value: "FFF")),
      ]
    )
  )

  let treeData = try! JSONEncoder().encode(tree)
  let treeJsonString = String(data: treeData, encoding: .utf8)!

  print(treeJsonString)
}
