import 'dart:io';

class Node<T> {
  T? value;
  Node? prev;
  Node? next;

  Node(this.value);
}

class DoublyLinkedList {
  Node? head;
  Node? tail;

  // Insertion at the beginning of the list
  void prepend(value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
      tail = newNode;
      return;
    }
    newNode.next = head;
    head!.prev = newNode;
    head = newNode;
  }

  // Insertion at the end of the list
  void append(value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
      tail = newNode;
      return;
    }
    newNode.prev = tail;
    tail!.next = newNode;
    tail = newNode;
  }

  // Insertion at a specific position
  void insertAtPosition(value, int position) {
    Node newNode = Node(value);
    if (position < 1) position = 0;

    if (head == null || position == 1) {
      prepend(value);
    } else {
      Node? current = head;
      for (int i = 0; i < position - 2 && current != null; i++) {
        current = current.next;
      }

      if (current == null) {
        append(value);
      } else {
        newNode.next = current.next;
        newNode.prev = current;
        current.next!.prev = newNode;
        current.next = newNode;
      }
    }
  }

  // Deletion from the beginning of the list
  void deleteFromBeginning() {
    if (head == null) return;

    if (head == tail) {
      head = null;
      tail = null;
    } else {
      head = head!.next;
      head!.prev = null;
    }
  }

  // Deletion from the end of the list
  void deleteFromEnd() {
    if (tail == null) return;

    if (head == tail) {
      head = null;
      tail = null;
    } else {
      tail = tail!.prev;
      tail!.next = null;
    }
  }

  // Deletion from a specific position
  void deleteFromPosition(int position) {
    if (head == null || position < 1) return;
    if (position == 1) {
      deleteFromBeginning();
    } else {
      Node? current = head;
      for (int i = 0; i < position && current != null; i++) {
        current = current.next;
      }

      if (current == null) return;

      if (current == tail) {
        deleteFromEnd();
      } else {
        current.prev!.next = current.next;
        current.next!.prev = current.prev;
      }
    }
  }

  // Deletion by value
  void deleteByValue(value) {
    if (head == null) {
      print('List is empty, nothing to remove');
      return;
    }
    if (head!.value == value) {
      head = head!.next;
      head!.prev = null;
      return;
    }

    Node? current = head;
    while (current!.next != null && current.next!.value != value) {
      current = current.next;
    }
  }

  // Display the elements of the list
  void display() {
    Node? current = head;
    while (current != null) {
      stdout.write('${current.value} \t');
      if (current.next == null) {
        print('');
      }
      current = current.next;
    }
  }

  // Reversing the elements of the list
  void displayReverse() {
    Node? current = tail;
    while (current != null) {
      stdout.write('${current.value} \t');
      current = current.prev;
    }
  }
}

void main() {
  DoublyLinkedList myList = DoublyLinkedList();

  myList.prepend(4);
  myList.prepend(2);
  myList.prepend(1);
  
  print("Original List:");
  myList.display();
  // myList.prepend(0);
  // myList.append(4);
  myList.insertAtPosition(3, 2);

  print("\nList after Insertions:");
  myList.display();

  myList.deleteFromBeginning();
  myList.deleteFromEnd();
  myList.deleteFromPosition(2);

  print("\nList after Deletions:");
  myList.display();

  // print('\nList after Reversing');
  // myList.displayReverse();

  myList.deleteByValue(3);
  myList.display();
}
