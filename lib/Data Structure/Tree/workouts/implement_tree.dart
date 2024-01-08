import 'dart:io';

class TreeNode<T> {
  T? value;
  TreeNode? left;
  TreeNode? right;

  TreeNode({this.value});
}

class Tree {
  TreeNode? root;

  insert(dynamic value) {
    TreeNode newNode = TreeNode(value: value);
    if (root == null) {
      root = newNode;
    } else {
      insertNode(root, newNode);
    }
  }

  insertNode(TreeNode? root, TreeNode newNode) {
    if (newNode.value < root!.value) {
      if (root.left == null) {
        root.left = newNode;
      } else {
        insertNode(root.left, newNode);
      }
    } else {
      if (root.right == null) {
        root.right = newNode;
      } else {
        insertNode(root.right, newNode);
      }
    }
  }

  search(TreeNode? root, dynamic value) {
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

  delete(value) {
    root = deleteNode(root, value);
  }

  deleteNode(TreeNode? root, dynamic value) {
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

  min(TreeNode? root) {
    if (root!.left == null) {
      return root.value;
    } else {
      return min(root.left);
    }
  }

  max(TreeNode? root) {
    if (root!.right == null) {
      return root.value;
    } else {
      return max(root.right);
    }
  }

  preOrder(TreeNode? root) {
    if (root != null) {
      print(root.value);
      preOrder(root.left);
      preOrder(root.right);
    }
  }

  postOrder(TreeNode? root) {
    if (root != null) {
      postOrder(root.left);
      postOrder(root.right);
      print(root.value);
    }
  }

  inOrder(TreeNode? root) {
    if (root != null) {
      inOrder(root.left);
      print(root.value);
      inOrder(root.right);
    }
  }

  levelOrder() {
    List<TreeNode> queue = [];
    queue.add(root!);
    while (queue.isNotEmpty) {
      TreeNode? current = queue.removeAt(0);
      stdout.write('${current.value} \t');
      if (current.left != null) {
        queue.add(current.left!);
      }
      if (current.right != null) {
        queue.add(current.right!);
      }
    }
  }

  isBST(TreeNode? root, dynamic minValue, dynamic maxValue) {
    if (root == null) {
      return true;
    }
    if (root.value <= minValue || root.value >= maxValue) {
      return false;
    }
    return isBST(root.left, minValue, root.value) &&
        isBST(root.right, root.value, maxValue);
  }
}

void main() {
  Tree tree = Tree();
  tree.insert(45);
  tree.insert(50);
  tree.insert(40);
  tree.insert(35);
  print(tree.search(tree.root, 45));
  // tree.delete(50);
  print(tree.search(tree.root, 50));
  tree.levelOrder();
  print(tree.isBST(tree.root, double.negativeInfinity, double.infinity));
}
