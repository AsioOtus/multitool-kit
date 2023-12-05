@available(iOS 13, macOS 10.15, *)
public protocol TreeNode<Leaf> {
  associatedtype Leaf

  typealias InnerTree = Tree<Leaf, Self>

	var depth: Int { get }

  var trees: [InnerTree] { get set }

  mutating func prepended (leaf: Leaf) -> Self
  mutating func prepended (node: Self) -> Self
  mutating func prepended (tree: InnerTree) -> Self
  mutating func prepended (trees: [InnerTree]) -> Self

  mutating func replaced (with tree: InnerTree, at index: Int) -> Self
  mutating func replacedAll (with trees: [InnerTree]) -> Self

  mutating func removed (at index: Int) -> Self
}

@available(iOS 13, macOS 10.15, *)
public extension TreeNode {
	var depth: Int {
		trees.map(\.depth).max() ?? 0
	}
}

@available(iOS 13, macOS 10.15, *)
public extension TreeNode {
  mutating func prepended (leaf: Leaf) -> Self {
    prepended(tree: .leaf(leaf))
  }

  mutating func prepended (node: Self) -> Self {
    prepended(tree: .node(node))
  }

  mutating func prepended (tree: InnerTree) -> Self {
    prepended(trees: [tree])
  }

  mutating func prepended (trees: [InnerTree]) -> Self {
    self.trees = trees + self.trees
    return self
  }

  mutating func replaced (with tree: InnerTree, at index: Int) -> Self {
    self.trees[index] = tree
    return self
  }

  mutating func replacedAll (with trees: [InnerTree]) -> Self {
    self.trees = trees
    return self
  }

  mutating func removed (at index: Int) -> Self {
    self.trees.remove(at: index)
    return self
  }
}
