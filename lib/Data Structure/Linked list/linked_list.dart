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
    Node? temp = head;
    while (temp != null) {
      count++;
      temp = temp.next;
    }
    return count;
  }

  void prepend(value) {
    Node node = Node(value);
    if (head != null) {
      node.next = head;
    }
    head = node;
  }

  void append(value) {
    Node node = Node(value);
    if (head == null) {
      head = node;
      return;
    }
    Node? current = head;
    while (current!.next != null) {
      current = current.next;
    }
    current.next = node;
  }

  insertAtIndex(value, index) {
    if (index < 0) {
      print('Invalid index');
      return;
    }
    if (index == 0) {
      prepend(value);
      return;
    }
    Node node = Node(value);
    Node? current = head;
    for (int i = 0; i < index - 1; i++) {
      if (current!.next == null) {
        print('Index out of range');
        return;
      }
      current = current.next;
    }
    node.next = current!.next;
    current.next = node;
  }

  removeAtIndex(index) {
    if (index <= 0) {
      print('Invalid index');
      return;
    }
    Node? removeNode;
    if (index == 0) {
      removeNode = head;
      head = removeNode!.next;
    } else {
      Node? current = head;
      for (int i = 0; i < index - 1; i++) {
        if (current!.next == null) {
          print('Index out of range');
        }
        current = current.next;
      }
      removeNode = current!.next;
      current.next = removeNode!.next;
    }
    return removeNode.value;
  }

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
  linkedList.prepend(1);
  linkedList.printList();
  linkedList.prepend(2);
  linkedList.printList();
  linkedList.append(3);
  linkedList.printList();
  linkedList.append(5);
  linkedList.printList();
  linkedList.insertAtIndex(10, 1);
  linkedList.printList();
  linkedList.removeAtIndex(0);
  linkedList.removeValue(3);
  // print(linkedList.search(11));
  linkedList.printList();
  // linkedList.reverse();
  // linkedList.printList();
  print("\nIs List Empty: ${linkedList.isEmpty()}");

  print("Size of list: ${linkedList.getSize()}");
}
