import 'dart:io';

class Node<T> {
  T? value;
  Node? next;

  Node({
    this.value,
  });
}

class Queue {
  Node? first;
  Node? last;

  enqueue(value) {
    Node newNode = Node(value: value);
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
      print('List is empty');
      return;
    }
    first = first!.next;
  }

  display() {
    Node? current = first;
    while (current != null) {
      stdout.write('${current.value}\t');
      if (current.next == null) {
        print('');
      }
      current = current.next;
    }
  }
}

void main() {
  Queue stack = Queue();
  stack.enqueue(1);
  stack.enqueue(2);
  stack.enqueue(3);
  stack.enqueue(10);
  stack.display();
  stack.dequeue();
  stack.display();
}
