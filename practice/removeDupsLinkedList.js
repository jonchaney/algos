const Node = require('./node.js');

let head = new Node();
let curr = head;
let array = [5,4,89,2,8,3,3,12,5,8,5,6,9];

// create unsorted linked list
for (let i = 0; i < array.length; i++) {
  curr.value = array[i];
  curr.next = new Node();
  curr = curr.next;
}


const removeDups = (head) => {
  // print linked list for testing
  curr = head;
  while (curr.next != null){
    console.log(curr.value);
    curr = curr.next;
  }
};

removeDups(head);