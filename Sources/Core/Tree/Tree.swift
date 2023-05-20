@available(iOS 13, macOS 10.15, *)
public indirect enum Tree <Leaf, Node> where Node: TreeNode<Leaf> {
  case leaf(Leaf)
  case node(Node)
}

@available(iOS 13, macOS 10.15, *)
extension Tree: Codable where Leaf: Codable, Node: Codable { }
