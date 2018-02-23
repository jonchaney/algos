// print list for testing.
const printLinkedList = (head) => {
    let curr = head;
    while (curr.next) {
      curr = curr.next;
      console.log(curr.value);
    }
};

module.exports = printLinkedList;