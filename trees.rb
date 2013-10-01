class Node
  attr_reader :left, :right, :value
  attr_writer :left, :right, :value
  
  def initialize
    @left = nil
    @right = nil
    @value = nil
  end
end

class BinaryTree
  attr_reader :root
  attr_writer :root
  
  def initialize
    @root = Node.new
  end
  
  def pre_order node
    p node.value
    pre_order(node.left) unless node.left.nil?
    pre_order(node.right) unless node.right.nil?
  end
  
  def in_order node
    in_order(node.left) unless node.left.nil?
    p node.value
    in_order(node.right) unless node.right.nil?
  end
  
  def post_order node
    post_order(node.left) unless node.left.nil?
    post_order(node.right) unless node.right.nil?
    p node.value
  end
  
  def traverse_types
    p "Pre-Order Traversal of tree"
    pre_order @root
    p "In-Order Traversal of tree:"
    in_order @root
    p "Post-Order traversal of tree:"
    post_order @root
  end
end

bTree = BinaryTree.new
root = bTree.root
root.value = "F"
 
node = Node.new
node.value = "B"
root.left = node
 
node = Node.new
node.value = "A"
root.left.left = node
 
node = Node.new
node.value = "D"
root.left.right = node
 
node = Node.new
node.value = "C"
root.left.right.left = node
 
node = Node.new
node.value = "E"
root.left.right.right = node
 
node = Node.new
node.value = "G"
root.right = node
 
node = Node.new
node.value = "I"
root.right.right = node
 
node = Node.new
node.value = "H"
root.right.right.left = node
 
bTree.traverse_types