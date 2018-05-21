def kth_largest(tree_node, k)
    traverse(tree_node)[-k]
end

def traverse(tree_node, arr = [])
    # left children, itself, right children
    if tree_node.left
      traverse(tree_node.left, arr)
    end

    arr.push(tree_node)

    if tree_node.right
      traverse(tree_node.right, arr)
    end

    arr
end

