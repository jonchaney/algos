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

// O(n) time complexity and space complexity O(m)
// use a buffer hash to store items that exist in the linked list and remove them if duplicates occur
// expected output: [5,4,89,2,8,3,12,6,9];
const removeDups = (head) => {
  let counter = {};
  let curr = head;
  let prev;
  while (curr.next !== null) {
    if (counter[curr.value]) {
      prev.next = curr.next;
    } else {
      counter[curr.value] = true;
      prev = curr;
    }
    curr = curr.next;
  }
};

// this does not use the hash buffer, but the time is O(n^2)
const removeDupsNoBuffer = (head) => {
  let curr = head;
  let prev;
  while (curr.next !== null) {
    let runner = curr.next;
    prev = curr;
    while (runner.next !== null) {
      if (curr.value === runner.value) {
        prev.next = runner.next;
        runner = runner.next;
      } else {
        prev = runner;
        runner = runner.next;
      }
    }
    curr = curr.next;
  }
};

removeDups(head);
removeDupsNoBuffer(head);

// print linked list for testing
curr = head;
while (curr.next !== null){
  console.log(curr.value);
  curr = curr.next;
}