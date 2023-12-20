import 'dart:io';

class Node {
  dynamic data;
  Node? prev;
  Node? next;

  Node(this.data);
}

class DoublyLinkedList {
  Node? head;
  Node? tail;

  // Insertion at the beginning of the list
  void insertAtBeginning(dynamic data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  // Insertion at the end of the list
  void insertAtEnd(dynamic data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.prev = tail;
      tail!.next = newNode;
      tail = newNode;
    }
  }

  // Insertion at a specific position
  void insertAtPosition(dynamic data, int position) {
    Node newNode = Node(data);
    if (position < 0) position = 0;

    if (head == null || position == 0) {
      insertAtBeginning(data);
    } else {
      Node? current = head;
      for (int i = 0; i < position - 1 && current != null; i++) {
        current = current.next;
      }

      if (current == null) {
        insertAtEnd(data);
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
    if (head == null || position < 0) return;

    if (position == 0) {
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

  // Display the elements of the list
  void display() {
    Node? current = head;
    while (current != null) {
      stdout.write('${current.data} \t');
      if (current.next == null) {
        print('');
      }
      current = current.next;
    }
  }

  void displayReverse() {
    Node? current = tail;
    while (current != null) {
      stdout.write('${current.data} \t');
      current = current.prev;
    }
  }
}

void main() {
  DoublyLinkedList myList = DoublyLinkedList();

  myList.insertAtEnd(1);
  myList.insertAtEnd(2);
  myList.insertAtEnd(3);

  print("Original List:");
  myList.display();

  myList.insertAtBeginning(0);
  myList.insertAtEnd(4);
  myList.insertAtPosition(5, 3);

  print("\nList after Insertions:");
  myList.display();

  myList.deleteFromBeginning();
  myList.deleteFromEnd();
  myList.deleteFromPosition(2);

  print("\nList after Deletions:");
  myList.display();

  print('\nList after Reversing');
  myList.displayReverse();
}
