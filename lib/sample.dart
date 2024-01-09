class Node<T> {
  T? value;
  Node? left;
  Node? right;

  Node({this.value});
}

class Tree {
  Node? root;

  insert(value) {
    Node newNode = Node(value: value);
    if (root == null) {
      root = newNode;
    } else {
      insertNodeHelper(root, newNode);
    }
  }

  insertNodeHelper(Node? root, Node? newNode) {
    if (newNode!.value < root!.value) {
      if (root.left == null) {
        root.left = newNode;
      } else {
        insertNodeHelper(root.left, newNode);
      }
    } else {
      if (root.right == null) {
        root.right = newNode;
      } else {
        insertNodeHelper(root.right, newNode);
      }
    }
  }

  
}

void main() {
  Tree tree = Tree();
  tree.insert(20);
  tree.insert(10);
  tree.insert(20);
}
