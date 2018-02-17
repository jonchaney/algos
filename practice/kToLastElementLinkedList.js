const Node = require('./node.js');

let head = new Node(1);
let curr = head;
let array = [2,3,4,5,6,7,8,9,10];
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
  for(let i = 0; i < (length-k)+1; i++) {
    curr = curr.next;
  }
  return curr.value;
};

const kToLastElementThree = (head, k) => {
  let p1 = head;
  let p2 = head;

  // move p1 k nodes into list
  for (let i = 0; i < k; i++) {
    if (p1 === null) return null; // out of bounds
    p1 = p1.next;
  }

  // move them up the list at the same pace when hits the end p2 will be at correct location
  while (p1) {
    p1 = p1.next;
    p2 = p2.next;
  }
  return p2;
};


// recursive solution
const kToLastElementRecursive = (head, k) => {
  if (head === null) { return -1; }
  let index = kToLastElementRecursive(head.next, k) + 1;
  if (index === k) {
    console.log(head.value);
  }
  return index;
};

const nthHelper = (head, k, i) => {
  if (head === null) {
    return null;
  }
  // node should be a point
  let node = nthHelper(head.next,k , i);
  i += 1;
  if (i === k) {
    return head;
  }
  return node;
};

const kToLastElementRecursiveTwo = (head, k) => {
  let i = 0;
  return nthHelper(head,k,i);
};

// expected output: 8
// console.log(kToLastElement(head, 4));
console.log(kToLastElementThree(head,1));
// kToLastElementRecursive(head,0);
// this solution only works in languages with pointers
// console.log(kToLastElementRecursiveTwo(head,0));



// print list for testing.
// curr = head;
// console.log(curr.value);
// while (curr.next) {
//   curr = curr.next;
//   console.log(curr.value);
// }

