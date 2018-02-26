// Partition: Write code to partition a linked list around a value x, 
// such that all nodes less than x come before all nodes greater than 
// or equal to x. If x is contained within the list, the values of x 
// only need to be after the elements less than x (see below). 
// The partition element x can appear anywhere in the "right partition"; 
// it does not need to appear between the left and right partitions.

const head = require('./createLinkedList.js');
const printLinkedList = require('./printLinkedList')

const paritition = (head, x) => {

}

// input: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1 [partition=5]
// expected output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8
paritition(head,5);
printLinkedList(head);

