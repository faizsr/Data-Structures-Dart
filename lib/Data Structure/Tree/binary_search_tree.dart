import 'dart:io';

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);
  // bst.insert(14);
  // bst.insert(20);
//   print(bst.search(bst.root, 20));
  bst.preOrder(bst.root);
  print('');
  bst.inOrder(bst.root);
  print('');
  bst.postOrder(bst.root);
}

class Node<T> {
  T? value;
  Node? left;
  Node? right;

  Node({this.value});
}

class BinarySearchTree {
  Node? root;

  isEmpty() {
    return root == null;
  }

  insert(value) {
    Node newNode = Node(value: value);
    if (isEmpty()) {
      root = newNode;
    } else {
      insertionNode(root, newNode);
    }
  }

  insertionNode(Node? root, Node? newNode) {
    if (newNode!.value < root!.value) {
      if (root.left == null) {
        root.left = newNode;
      } else {
        insertionNode(root.left, newNode);
      }
    } else {
      if (root.right == null) {
        root.right = newNode;
      } else {
        insertionNode(root.right, newNode);
      }
    }
  }

  search(Node? root, dynamic value) {
    if (root == null) {
      return 'Value not found';
    } else {
      if (root.value == value) {
        return 'Value found';
      } else if (value < root.value) {
        return search(root.left, value);
      } else {
        return search(root.right, value);
      }
    }
  }

  // ========== DSF (Depth first search) ==========
  preOrder(Node? root) {
    if (root != null) {
      stdout.write('${root.value} \t');
      preOrder(root.left);
      preOrder(root.right);
    }
  }

  inOrder(Node? root) {
    if (root != null) {
      inOrder(root.left);
      stdout.write('${root.value} \t');
      inOrder(root.right);
    }
  }

  postOrder(Node? root) {
    if (root != null) {
      postOrder(root.left);
      postOrder(root.right);
      stdout.write('${root.value} \t');
    }
  }
}
