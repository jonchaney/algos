// Sum Lists: You have two numbers represented by a linked list, where each node contains a single digit.
// The digits are stored in reverse order, such that the 1 's digit is at the head of the list. 
// Write a function that adds the two numbers and returns the sum as a linked list.

// Input: (7-> 1 -> 6) + (5 -> 9 -> 2).That is, 617 + 295. Output: 2 -> 1 -> 9. That is, 912.


const printLinkedList = require('./printLinkedList')
const Node = require('./node.js');

const sumLists = (nodeA, nodeB) => {

};


// create linked lists 
let nodeA = new Node(7);
let curr = nodeA;
let arr = [1,6]
for (let i = 0; i<arr.length; i++) {
  curr.next = new Node(arr[i])
  curr = curr.next;
}

let nodeB = new Node(5);
curr = nodeB;
arr = [9,2]
for (let i = 0; i<arr.length; i++) {
  curr.next = new Node(arr[i])
  curr = curr.next;
}

// call function
sumLists(nodeA, nodeB);