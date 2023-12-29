import 'dart:io';

class Node<T> {
  T? value;
  Node? next;

  Node(this.value);
}

class Queue {
  Node? first;
  Node? last;

  enqueue(value) {
    Node? newNode = Node(value);
    if (first == null) {
      first = newNode;
      last = newNode;
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
      stdout.write('${current.value} \t');
      current = current.next;
    }
  }
}

void main(List<String> args) {
  Queue queue = Queue();
  queue.enqueue(20);
  queue.enqueue(50);
  queue.enqueue(60);
  queue.dequeue();
  queue.display();
}
