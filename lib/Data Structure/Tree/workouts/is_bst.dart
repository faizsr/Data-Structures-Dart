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

  bool isValidBST(Node? root, dynamic minValue, dynamic maxValue) {
    if (root == null) {
      return true;
    }
    if (root.value <= minValue || root.value >= maxValue) {
      return false;
    }
    return isValidBST(root.left, minValue, root.value) &&
        isValidBST(root.right, root.value, maxValue);
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
  print(bst.isValidBST(bst.root, double.negativeInfinity, double.infinity));
}
