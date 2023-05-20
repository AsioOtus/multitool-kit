@available(iOS 13, macOS 10.15, *)
public struct StandardTreeNode <Details, Leaf>: TreeNode {
  public typealias Leaf = Leaf

  public let details: Details
  public var trees: [InnerTree]

  public init (details: Details, trees: [InnerTree]) {
    self.details = details
    self.trees = trees
  }

  public mutating func prepended (leaf: Leaf) -> Self {
    prepended(tree: .leaf(leaf))
  }

  public mutating func prepended (node: Self) -> Self {
    prepended(tree: .node(node))
  }

  public mutating func prepended (tree: InnerTree) -> Self {
    prepended(trees: [tree])
  }

  public mutating func prepended (trees: [InnerTree]) -> Self {
    self.trees = trees + self.trees
    return self
  }

  public mutating func replaced (with tree: InnerTree, at index: Int) -> Self {
    self.trees[index] = tree
    return self
  }

  public mutating func replacedAll (with trees: [InnerTree]) -> Self {
    self.trees = trees
    return self
  }

  public mutating func removed (at index: Int) -> Self {
    self.trees.remove(at: index)
    return self
  }
}

@available(iOS 13, macOS 10.15, *)
extension StandardTreeNode: Codable where Details: Codable, Leaf: Codable { }


@available(iOS 13, macOS 10.15, *)
extension StandardTreeNode: Identifiable where Details: Identifiable {
  public var id: Details.ID { details.id }
}
