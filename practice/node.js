class Node {
  constructor(value=null) {
    this.value = value;
    this.next = null;
    this.prev = null;
  }

  append(node) {
    this.next = node;
  }
}

module.exports = Node;