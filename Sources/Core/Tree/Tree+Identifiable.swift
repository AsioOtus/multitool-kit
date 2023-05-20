@available(iOS 13, macOS 10.15, *)
extension Tree: Identifiable where Leaf: Identifiable, Node: Identifiable, Leaf.ID == Node.ID {
  public typealias ID = Node.ID

  public var id: ID {
    switch self {
    case .leaf(let leaf): return leaf.id
    case .node(let node): return node.id
    }
  }
}
