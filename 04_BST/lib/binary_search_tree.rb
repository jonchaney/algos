# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
require 'byebug'
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
    @root = delete_from_tree(@root, value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    max = tree_node
    until max.right.nil?
      max = max.right
    end 
    max
  end

  def depth(tree_node = @root)
    if tree_node.nil?
      return -1;
    else
      left_depth = depth(tree_node.left)
      right_depth = depth(tree_node.right)

      if left_depth > right_depth
        return left_depth + 1
      else
        return right_depth + 1
      end
    end
  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?

    balanced = true
    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)
    balanced = false if (left_depth - right_depth).abs > 1

    if balanced && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
      return true
    end

    false

  end

  def in_order_traversal(tree_node = @root, arr = [])
    # left children, itself, right children
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end

    arr.push(tree_node.value)

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end

    arr
  end

  private
  # optional helper methods go here:
  def delete_from_tree(tree_node, value)
    if value == tree_node.value
      tree_node = remove(tree_node)
    elsif value <= tree_node.value
      tree_node.left = delete_from_tree(tree_node.left, value)
    else value > tree_node.value
      tree_node.right = delete_from_tree(tree_node.right, value)
    end
    tree_node
  end 

  def remove(node)
    if node.left.nil? && node.right.nil?
      node = nil
    elsif node.left && node.right.nil? 
      node = node.left
    elsif node.left.nil? && node.right
      node = node.right
    else 
      node = replace_node(node)
    end 
    node
  end

  def replace_node(node)
    # get max ie replacement node
    replacement_node = maximum(node.left)
    # if replacement node has left child, promote said child
    if replacement_node.left
      promote_child(node.left)
    end
    # we have to update its children pointers
    replacement_node.left = node.left
    replacement_node.right = node.right

    replacement_node
  end

  def promote_child(tree_node)
    if tree_node.right
      current_parent = tree_node
      maximum_node = maximum(tree_node.right)
    else
      return tree_node
    end
    current_parent.right = maximum_node.left
  end

  # recursive algorithm to append to the BST
  def append(node, value)
    if value > node.value 
      if node.right 
        append(node.right, value)
      else 
        node.right = BSTNode.new(value)
      end 
    else 
      if node.left 
        append(node.left, value)
      else 
        node.left = BSTNode.new(value)
      end 
    end 
  end 

end