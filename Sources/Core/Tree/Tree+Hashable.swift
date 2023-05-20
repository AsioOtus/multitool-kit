@available(iOS 13, macOS 10.15, *)
extension Tree: Equatable where Leaf: Equatable, Node: Equatable {
  public static func == (lhs: Self, rhs: Self) -> Bool {
    switch (lhs, rhs) {
    case (.node(let leftNode), .node(let rightNode)): return leftNode == rightNode
    case (.leaf(let leftLeaf), .leaf(let rightLeaf)): return leftLeaf == rightLeaf
    default: return false
    }
  }
}

@available(iOS 13, macOS 10.15, *)
extension Tree: Hashable where Leaf: Hashable, Node: Hashable {
  public func hash (into hasher: inout Hasher) {
    switch self {
    case .leaf(let transfer): hasher.combine(transfer.hashValue)
    case .node(let transferGroup): hasher.combine(transferGroup.hashValue)
    }
  }
}
