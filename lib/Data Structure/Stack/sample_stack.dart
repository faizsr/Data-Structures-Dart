import 'dart:io';

class Node<T> {
  T? value;
  Node? next;

  Node({this.value});
}

class Stack {
  Node? top;

  push(value) {
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
      print('No elements in the stack');
      return;
    }
    top = top!.next;
  }

  display() {
    Node? current = top;
    while (current != null) {
      stdout.write('${current.value} \t');
      if (current.value == null) {
        print('');
      }
      current = current.next;
    }
  }
}

void main() {
  Stack stack = Stack();
  stack.push(40);
  stack.push(50);
  stack.pop();
  stack.display();
}
