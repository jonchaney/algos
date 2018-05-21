var binaryTreePaths = function(root) {
    var paths = [];
    if(!root) return [];
    if(root.left == null && root.right == null){
        if(paths.length == 0) return [""+root.val];
        else return root.val;
    } 
    else{
        if(root.left) 
          binaryTreePaths(root.left).forEach(function(lp) {
            paths.push(root.val + "->" + lp);
          });
        if(root.right) 
          binaryTreePaths(root.right).forEach(function(rp) {
            paths.push(root.val + "->" + rp);
          });
    }

    return paths;
};