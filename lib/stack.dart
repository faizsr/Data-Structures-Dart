class Node<T> {
  T? value;
  Node? next;

  Node({this.value});
}

class Stack {
  Node? top;

  push(int value) {
    Node? newNode = Node(value: value);
    if (top == null) {
      top = newNode;
      return;
    }
    newNode.next = top;
    top = newNode;
  }

  pop() {
    if (top == null) {
      print('List is empty');
      return;
    }
    top = top!.next;
  }

  display() {
    Node? current = top;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }

  delete(int value) {
    Node? current = top;
    if (current!.value == value) {
      top = top!.next;
    }
    while (current!.next != null) {
      if (current.next!.value == value) {
        current.next = current.next!.next;
      }
      current = current.next;
    }
  }
}

void main() {
  // Stack stack = st
}
