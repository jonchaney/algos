# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    if @root 
      append(@root, value)
    else 
      @root = BSTNode.new(value)
    end 
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    if tree_node.value == value 
      return tree_node
    else 
      if value > tree_node.value 
        find(value, tree_node.right)
      else 
        find(value, tree_node.left)
      end 
    end 
  end

  def delete(value)
      node = self.find(value)
      if node 
        if node.right.nil? && node.left.nil?
          # if not the root node
          if node.parent
           # find the correct node and delete it
           if node.parent.left.value == value
            node.parent.left = nil 
           else   
            node.parent.right = nil 
           end 
          else 
            # remove root
            @root = nil
          end 
        end 
      end 
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

  # recursive algorithm to append to the BST
  def append(node, value)
    if value > node.value 
      if node.right 
        append(node.right, value)
      else 
        node.right = BSTNode.new(value, node)
      end 
    else 
      if node.left 
        append(node.left, value)
      else 
        node.left = BSTNode.new(value, node)
      end 
    end 
  end 

end