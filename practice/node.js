class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
    this.prev = null;
  }

  append(node) {
    this.next = node;
  }
}

module.exports = Node;