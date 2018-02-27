// Partition: Write code to partition a linked list around a value x, 
// such that all nodes less than x come before all nodes greater than 
// or equal to x. If x is contained within the list, the values of x 
// only need to be after the elements less than x (see below). 
// The partition element x can appear anywhere in the "right partition"; 
// it does not need to appear between the left and right partitions.

// create two linked list, one with elements that are greater than x,
// one with elements that are smaller than x and append them together.
const head = require('./createLinkedList.js');
const printLinkedList = require('./printLinkedList')
const Node = require('./node.js');

const paritition = (node, x) => {
    let head = node;
    let tail = node;
    while (node) {
        next = node.next;
        if (node.value < x) {
            node.next = head;
            head = node;
        } else {
            tail.next = node;
            tail = node;
        }
        node = next;
    }
    tail.next = null;
    return head;
}

// input: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1 [partition=5]
// example output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8
printLinkedList(head);
console.log("after");
printLinkedList(paritition(head,5));



