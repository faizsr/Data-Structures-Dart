class Node<T> {
  T? value;
  Node? next;

  Node({this.value});
}

class Queue {
  Node? first;
  Node? last;

  enqueue(int value) {
    Node? newNode = Node(value: value);
    if (first == null) {
      first = newNode;
      last = newNode;
      return;
    }
    last!.next = newNode;
    last = newNode;
  }

  dequeue() {
    if (first == null) {
      print('No elements');
      return;
    }
    first = first!.next;
  }

  display() {
    Node? current = first;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}
