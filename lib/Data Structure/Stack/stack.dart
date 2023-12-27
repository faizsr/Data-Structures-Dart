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
    Node? current = top;
    top = newNode;
    top!.next = current;
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
      stdout.write('${current.value} \t');
      if (current.next == null) {
        print('');
      }
      current = current.next;
    }
  }
}

void main(List<String> args) {
  Stack stack = Stack();

  stack.push(10);
  stack.push(20);
  stack.push(30);
  stack.display();
  stack.pop();
  stack.display();
}
