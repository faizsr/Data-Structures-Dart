import 'dart:io';

class Node<T> {
  T? value;
  Node? next;

  Node({this.value, this.next});
}

class Stack {
  Node? top;

  push(value) {
    Node newNode = Node(value: value);
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
    var value = top!.value;
    top = top!.next;
    return value;
  }

  display() {
    Node? current = top;
    while (current != null) {
      stdout.write('${current.value} \t');
      if (current.next == null) {
        print('');
      }
      current = current.next;
    }
  }

  bool isEmpty() {
    return top == null;
  }
}

class QueueUsingStack {
  Stack stack1 = Stack();
  Stack stack2 = Stack();

  enqueue(value) {
    while (!stack1.isEmpty()) {
      stack2.push(stack1.pop());
    }
    stack1.push(value);
    while (!stack2.isEmpty()) {
      stack1.push(stack2.pop());
    }
  }

  dequeue() {
    if (stack1.isEmpty()) {
      print('Queue is empty');
      return;
    }
    return stack1.pop();
  }

  void display() {
    stack1.display();
  }
}

void main(List<String> args) {
  QueueUsingStack queue = QueueUsingStack();

  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(60);
  queue.enqueue(30);
  queue.display();
  queue.dequeue();
  queue.display();
}
