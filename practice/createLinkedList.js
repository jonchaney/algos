const Node = require('./node.js');

let head = new Node(0);
let curr = head;
for (let i = 1; i<=10; i++) {
  curr.next = new Node(i)
  curr = curr.next;
}


module.exports = head;