// print list for testing.
const printLinkedList = (head) => {
    let curr = head;
    while (curr) {
      console.log(curr.value);
      curr = curr.next;
    }
};

module.exports = printLinkedList;