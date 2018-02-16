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
  let length = 0;

  while (true) {
    length+=2;
    if (p2.next.next) {
      p2 = p2.next.next;
      p1 = p1.next;
    } else {
      p2 = p2.next;
      break;
    }
  }

  console.log(`p1: ${p1.value}, p2: ${p2.value}, length: ${length}`); 
};


// recursive solution
const kToLastElementRecursive = (head, k) => {
  if (head.next === null) { return head.value; }

  return kToLastElementRecursive(head.next, k);
};

// expected output: 8
// console.log(kToLastElement(head, 4));
kToLastElementTwo(head,0);
// kToLastElementRecursive(head,0);



// print list for testing.
curr = head;
console.log(curr.value);
while (curr.next) {
  curr = curr.next;
  console.log(curr.value);
}

