# Given two child nodes, find their least common ancestor. 
require '../04_BST/lib/binary_search_tree.rb'
def common_ancestor(root, nodeA, nodeB) 
    path_to_A = []
    find_path(root, nodeA, path_to_A)
    path_to_B = []
    find_path(root, nodeB, path_to_B)
    i = path_to_A.length-1
    while i < path_to_A.length
        return path_to_A[i] if path_to_B.include?(path_to_A[i])
        i+=1
    end
    p 'test' 
    nil
end 

def find_path(root, node, path)
    return nil if root.nil?
    return root if root == node
    path.push(root)
    return true if root == node
    return true if ((root.left && find_path(root.left, node, path)) || (root.right && find_path(root.right, node, path)))
    # If not present in subtree rooted with root, remove root from
    # path[] and return false
    path.pop
    false
end

bst = BinarySearchTree.new
[5, 3, 7, 1, 4, 9, 0, 2, 1.5, 10].each do |el|
    bst.insert(el)
end

nodeA = bst.root.left.left
nodeB = bst.root.left.right
# expected output: 3
p common_ancestor(bst.root, nodeA, nodeB).value

#############################
# prefilled_bst looks like: #
#             (5)           #
#            /   \          #
#          (3)   (7)        #
#         /  \      \       #
#      (1)   (4)    (9)     #
#     /   \            \    #
#   (0)   (2)          (10) #
#        /                  #
#      (1.5)                #
#############################

