import 'dart:io';

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

  // ========= BFS (Breadth first search) =========

  levelOrder() {
    List<Node> queue = [];
    queue.add(root!);
    // print('root :${queue[0].value}');
    while (queue.isNotEmpty) {
      Node? current = queue.removeAt(0);
      stdout.write('${current.value} \t');
      if (current.left != null) {
        queue.add(current.left!);
      }
      if (current.right != null) {
        queue.add(current.right!);
      }
    }
  }

  // ========== Finding the min and max value ==========

  min(Node? root) {
    if (root!.left == null) {
      return root.value;
    } else {
      return min(root.left);
    }
  }

  max(Node? root) {
    if (root!.right == null) {
      return root.value;
    } else {
      return max(root.right);
    }
  }

  // ========== Delete operation ==========

  delete(dynamic value) {
    root = deleteNode(root, value);
  }

  deleteNode(Node? root, dynamic value) {
    if (root == null) {
      return root;
    }
    if (value < root.value) {
      root.left = deleteNode(root.left, value);
    } else if (value > root.value) {
      root.right = deleteNode(root.right, value);
    } else {
      if (root.left == null && root.right == null) {
        return null;
      }
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
      root.value = min(root.right);
      root.right = deleteNode(root.right, root.value);
    }
    return root;
  }

  // ========== Valid Binary Search Tree ==========
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

  int maxDepth(Node? root) {
    if (root == null) {
      return 0;
    }
    int left = maxDepth(root.left);
    int right = maxDepth(root.right);

    return left > right ? left + 1 : right + 1;
  }

  int minDepth(Node? root) {
    if (root == null) {
      return 0;
    }
    int left = minDepth(root.left);
    int right = minDepth(root.right);

    return left > right ? left + 1 : right + 1;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  // bst.insert(50);
  // bst.insert(25);
  // bst.insert(75);
  // bst.insert(12);
  // bst.insert(6);
  // bst.insert(60);
  // bst.insert(52);
  // bst.insert(70);
  // bst.insert(7);
  bst.insert(2);
  bst.insert(3);
  bst.insert(4);
  bst.insert(5);
  bst.insert(6);

  stdout.write('Preorder: ');
  bst.preOrder(bst.root);
  print('');

  stdout.write('Inorder: ');
  bst.inOrder(bst.root);
  print('');

  stdout.write('Postorder: ');
  bst.postOrder(bst.root);
  print('');

  stdout.write('Level order: ');
  bst.levelOrder();
  print('');

  print('Smallest node: ${bst.min(bst.root)}');
  print('Largest node: ${bst.max(bst.root)}');

  bst.delete(25);
  stdout.write('Level order: ');
  bst.levelOrder();
  print('');
  print(bst.isValidBST(bst.root, double.negativeInfinity, double.infinity));

  print(bst.minDepth(bst.root));
}
