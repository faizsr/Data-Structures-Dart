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
    var value = first!.value;
    first = first!.next;
    return value;
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

  bool isEmpty() {
    return first == null;
  }
}

class StackUsingQueue {
  Queue queue1 = Queue();
  Queue queue2 = Queue();

  void push(value) {
    while (!queue1.isEmpty()) {
      queue2.enqueue(queue1.dequeue());
    }
    queue1.enqueue(value);
    while (!queue2.isEmpty()) {
      queue1.enqueue(queue2.dequeue());
    }
  }

  void pop() {
    if (queue1.isEmpty()) {
      print('Stack is empty');
      return;
    }
    queue1.dequeue();
  }

  void display() {
    queue1.display();
  }
}

void main() {
  StackUsingQueue stack = StackUsingQueue();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(10);
  stack.display();
  stack.pop();
  stack.display();
}
