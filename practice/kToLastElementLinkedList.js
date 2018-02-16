const Node = require('./node.js');

let head = new Node(1);
let curr = head;
let array = [2,3,4,5,6,7,8,9];
// let array = [5, 4, 89, 2];

// create unsorted linked list
for (let i = 0; i < array.length; i++) {
  curr.append(new Node(array[i]));
  curr = curr.next;
}


// brute force:
// iterate to end of list to get length
// iterate again to print element at length - k
// O(n)
const kToLastElement = (head, k) => {
  let length = 0;
  curr = head;
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

// using two pointers, more efficient than the previous
const kToLastElementTwo = (head, k) => {
  // return head.value if list is one item
  if (head.next === null) { return head.value; }
  let p1 = head;
  let p2 = p1;
  let mid = 0;

  while (true) {
    mid+=1;
    if (p2.next.next) {
      p2 = p2.next.next;
      p1 = p1.next;
    } else {
      p2 = p2.next;
      break;
    }
  }

  // if mid is less than k increment to to node
  if (k<=mid) {
    for (let i = 0; i < mid-k; i++) {
      p1 = p1.next;
    }
      return p1.value;
  } else {

  } 


};


// recursive solution
const kToLastElementRecursive = (head, k) => {
  if (head === null) { return 0; }

  let index = kToLastElementRecursive(head.next, k) + 1;
  if (index === k) {
    console.log(head.value);
  }

  return index;
};

// expected output: 8
// console.log(kToLastElement(head, 4));
// console.log(kToLastElementTwo(head,1));
kToLastElementRecursive(head,0);



// print list for testing.
curr = head;
console.log(curr.value);
while (curr.next) {
  curr = curr.next;
  console.log(curr.value);
}

