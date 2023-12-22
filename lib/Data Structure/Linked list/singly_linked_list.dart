import 'dart:io';

class Node<T> {
  T? value;
  Node? next;

  Node(this.value);
}

class LinkedList {
  Node? head;

  bool isEmpty() {
    return head == null;
  }

  int getSize() {
    int count = 0;
    Node? current = head;
    while (current != null) {
      count++;
      current = current.next;
    }
    return count;
  }

  // Insertion at the beginning of the list
  void prepend(value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
      return;
    }
    newNode.next = head;
    head = newNode;
  }

  // Insertion at the end of the list
  void append(value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
      return;
    }
    Node? current = head;
    while (current!.next != null) {
      current = current.next;
    }
    current.next = newNode;
  }

  // Insertion at a specific position
  insertAtPosition(value, position) {
    Node newNode = Node(value);
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

  // Deletion from a specific position
  removeAtPostion(position) {
    if (position < 1) {
      print('Invalid position');
      return;
    }
    Node? removeNode;
    if (position == 1) {
      removeNode = head;
      head = removeNode!.next;
    } else {
      Node? current = head;
      for (int i = 0; i < position - 2; i++) {
        if (current!.next == null) {
          print('Postion out of range');
        }
        current = current.next;
      }
      removeNode = current!.next;
      current.next = removeNode!.next;
    }
    return removeNode.value;
  }

  // Deletion of a specific value
  removeValue(value) {
    if (isEmpty()) {
      print('List is empty, nothing to remove');
      return null;
    } else {
      if (head!.value == value) {
        head = head!.next;
        return value;
      } else {
        Node? current = head;
        Node? removeNode;
        while (current!.next != null && current.next!.value != value) {
          current = current.next;
        }
        if (current.next != null) {
          removeNode = current.next;
          current.next = removeNode!.next;
          return value;
        }
        print("Value not found in the list");
        return null;
      }
    }
  }

  // Search by value
  search(value) {
    if (isEmpty()) {
      print('List is empty');
      return -1;
    } else {
      Node? current = head;
      int i = 0;
      while (current != null) {
        if (current.value == value) {
          print('Value found');
          return i;
        } else {
          current = current.next;
          i++;
        }
      }
      print('Value not found');
      return -1;
    }
  }

  // Reversing the elements of the list
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

  // Deleting duplicates from a sorted list
  removeDuplicatesFromSortedList() {
    if (isEmpty()) {
      print('List is empty');
      return;
    }
    Node? current = head;
    for (var i = 0; current!.next!.next != null; i++) {
      if (current.value == current.next!.value) {
        current.next = current.next!.next;
      }
      current = current.next;
    }
    if (current.value == current.next!.value) {
      current.next = current.next!.next;
    }
  }

  // Array to linkedList
  arrayToLinkedList(List<dynamic> arr) {
    for (var element in arr) {
      append(element);
    }
  }

  // Display the elements of the list
  void printList() {
    Node? current = head;
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
  LinkedList linkedList = LinkedList();
  linkedList.prepend(2);
  linkedList.printList();
  linkedList.prepend(1);
  linkedList.printList();
  linkedList.append(2);
  linkedList.printList();
  linkedList.append(5);
  linkedList.printList();
  linkedList.insertAtPosition(5, 5);
  linkedList.printList();
  // linkedList.removeAtPostion(1);
  // linkedList.removeValue(3);
  // print(linkedList.search(11));
  // linkedList.printList();
  linkedList.removeDuplicatesFromSortedList();
  linkedList.printList();
  print("\nIs List Empty: ${linkedList.isEmpty()}");

  print("Size of list: ${linkedList.getSize()}");

  LinkedList ls = LinkedList();
  ls.arrayToLinkedList([3, 5, 25, 2, 2, 4]);
  ls.printList();
}
