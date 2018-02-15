const Node = require('./node.js');

let head = new Node();
let curr = head;
let array = [5, 4, 89, 2, 8, 3, 3, 12, 5, 8, 5, 6, 9];

// create unsorted linked list
for (let i = 0; i < array.length; i++) {
  curr.value = array[i];
  curr.next = new Node();
  curr = curr.next;
}

// brute force:
// iterate to end of list to get length
// iterate again to print element at length - k
// O(n)
const kToLastElement = (head, k) => {
  let length = 0;
  let curr = head;
  while (curr.next !== null) {
    length+=1;
    curr = curr.next;
  }
  curr = head;
  for(let i = 0; i < length-k; i++) {
    curr = curr.next;
  }
  return curr.value;
};

// expected output: 8
console.log(kToLastElement(head, 4));
