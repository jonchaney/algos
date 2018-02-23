// Implement an algorithm to delete a node in the middle (i.e., any node but the firrst and last node, 
// not necessarily the exact middle) of a singly linked list, given only access to that node.
// EXAMPLE
// Input: the node 5 from the linked list 1->2->3->4->5->6->7->8->9->10
// Result: nothing is returned, but the new linked list looks likea->b->d->e- >f

const head = require('./createLinkedList.js');
const printLinkedList = require('./printLinkedList')

// print list for testing.
// printLinkedList(head);


const deleteMiddleNode = (head, val) => {
    // console.log(head)
    let curr = head.next,
        prev = head;

    while (curr.value !== val) {
        prev = curr;
        curr = curr.next;
    }
    prev.next = curr.next;
};

deleteMiddleNode(head,5);
printLinkedList(head);