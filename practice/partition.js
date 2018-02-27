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
// console.log('head')
// printLinkedList(head);

const paritition = (head, x) => {
    let curr_less = null;
    let curr_greater = null;
    let head_greater = null;
    let curr = head;
    // split list into two lists, one with elems < x, one with elems > x
    while (curr) {
        let temp = new Node(curr.value);
        if (curr.value < x) {
            if (curr_less) {
                curr_less.append(temp)
                curr_less = curr_less.next
            } else {
                curr_less = curr;
            }
        } else {
            if (curr_greater) {
                curr_greater.append(temp)
                curr_greater = curr_greater.next
                
            } else {
                curr_greater = curr;
                head_greater = curr_greater;
            }
        }
        curr = curr.next;
    }

    // append list to each other, by appending curr_less to greater_head
    curr_less.append(head_greater);
    head = curr_less;
}

// input: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1 [partition=5]
// expected output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8
printLinkedList(head);
console.log("after");
paritition(head,5);
printLinkedList(head);


