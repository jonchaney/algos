const Node = require('./node.js');

let head = new Node(3);
let curr = head;
let arr = [5,8,5,10,2,1]
for (let i = 0; i<arr.length; i++) {
  curr.next = new Node(arr[i])
  curr = curr.next;
}


module.exports = head;