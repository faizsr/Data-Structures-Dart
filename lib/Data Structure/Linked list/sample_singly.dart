import 'dart:io';

class Node<T> {
  T? value;
  Node? next;

  Node({this.value});
}

class LinkedList {
  Node? head;

  prepend(value) {
    Node newNode = Node(value: value);
    if (head == null) {
      head = newNode;
      return;
    }
    newNode.next = head;
    head = newNode;
  }

  append(value) {
    Node newNode = Node(value: value);
    if (head == null) {
      head == newNode;
      return;
    }
    Node? current = head;
    while (current!.next != null) {
      current = current.next;
    }
    print("current ${current.value}");
    current.next = newNode;
  }

  insertAtPosition(value, position) {
    Node newNode = Node(value: value);
    if (position < 1) {
      print('Invalid position');
      return;
    }
    if (position == 1) {
      prepend(value);
      return;
    }
    Node? current = head;
    for (int i = 0; i < position - 2; i++) {
      if (current!.next == null) {
        print('Position out of range');
        return;
      }
      current = current.next;
    }
    newNode.next = current!.next;
    current.next = newNode;
  }

  removeAtPosition(position) {
    if (position < 1) {
      print('Invalid Position');
      return;
    }
    Node? removeNode;
    if (position == 1) {
      removeNode = head;
      head = removeNode!.next;
    }

    Node? current = head;
    for (int i = 0; i < position - 2; i++) {
      if (current!.next == null) {
        print('Position out of range');
        return;
      }
      current = current.next;
    }
    // removeNode = current!.next;
    current!.next = current.next!.next;
  }

  removeByvalue(value) {
    if (head == null) {
      print('List is empty');
      return;
    }

    Node? current = head;

    while (current!.next != null && current.next!.value != value) {
      current = current.next;
    }
    if (current.next != value) {
      current.next = current.next!.next;
      return value;
    }
    print('Value not found in the list');
    return;
  }

  search(value) {
    if (head == null) {
      print('List is empty');
      return;
    }

    Node? current = head;
    int i = 1;
    while (current != null) {
      if (current.value == value) {
        print('Value found at position $i');
        return;
      }
      current = current.next;
      i++;
    }
    print('Value not found');
    return -1;
  }

  reverse() {
    Node? prev;
    Node? current = head;
    while (current != null) {
      Node? next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    head = prev;
  }

  displayList() {
    Node? current = head;
    if (head == null) {
      print('No elements in the list');
      return;
    }

    while (current != null) {
      stdout.write('${current.value}    ');
      current = current.next;
    }
    print(' ');
  }

  insertBefore(value, newValue) {
    Node newNode = Node(value: newValue);
    if (head!.value == value) {
      prepend(newValue);
      return;
    }

    Node? current = head;
    while (current!.next != null && current.next!.value != value) {
      current = current.next;
    }
    if (current.next == null) {
      print('Value not found');
      return;
    }
    if (current.next!.value == value) {
      newNode.next = current.next;
      current.next = newNode;
    }
    print(current.value);
  }

  findLength() {
    Node? current = head;
    int length = 0;
    while (current != null) {
      length++;
      current = current.next;
    }
    return length;
  }

  findMiddleElement() {
    if (head != null) {
      int length = findLength();
      Node? current = head;
      int middle = (length / 2).floor();
      print('middle: $middle');
      while (middle != length) {
        current = current!.next;
        stdout.write('${current!.value}   ');
        middle++;
      }
    }
  }
}

void main() {
  LinkedList mylist = LinkedList();

  mylist.prepend(1);
  mylist.prepend(3);
  mylist.append(20);
  mylist.prepend(5);
  mylist.append(10);
  mylist.displayList();

  // mylist.removeAtPosition(4);
  // mylist.displayList();
  // mylist.removeByvalue(1);
  // mylist.displayList();
  // mylist.search(3);
  // mylist.reverse();
  // mylist.displayList();

  // mylist.insertBefore(10, 50);
  // mylist.displayList();

  mylist.findMiddleElement();
}
