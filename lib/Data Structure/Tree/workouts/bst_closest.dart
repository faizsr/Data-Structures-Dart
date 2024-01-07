class Node<T> {
  T? value;
  Node? left;
  Node? right;

  Node({this.value});
}

class BinarySearchTree {
  Node? root;

  insert(value) {
    Node newNode = Node(value: value);
    if (root == null) {
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

  findClosetValue(dynamic target) {
    dynamic closest = double.infinity;
    Node? current = root;
    while (current != null) {
      if ((current.value - target) < (closest - target)) {
        closest = current.value;
      }
      if (target < current.value) {
        current = current.left;
      } else if (target > current.value) {
        current = current.right;
      } else {
        break;
      }
    }
    return closest;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(50);
  bst.insert(25);
  bst.insert(75);
  bst.insert(12);
  bst.insert(6);
  bst.insert(60);
  bst.insert(52);
  bst.insert(70);
  bst.insert(7);
  print(bst.findClosetValue(60));
}
