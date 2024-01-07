class TrieNode {
  late Map<String, TrieNode> children;
  late bool isWordEnd;

  TrieNode() {
    children = {};
    isWordEnd = false;
  }
}

class Trie {
  late TrieNode root;
  Trie() {
    root = TrieNode();
  }

  void insert(String word) {
    TrieNode? currentNode = root;
    for (int i = 0; i < word.length; i++) {
      String charToInsert = word[i];
      if (!currentNode!.children.containsKey(charToInsert)) {
        currentNode.children[charToInsert] = TrieNode();
      }
      currentNode = currentNode.children[charToInsert];
    }
    currentNode!.isWordEnd = true;
  }

  bool contains(String word) {
    TrieNode? currentNode = root;
    for (int i = 0; i < word.length; i++) {
      String charToFind = word[i];
      if (!currentNode!.children.containsKey(charToFind)) {
        return false;
      }
      currentNode = currentNode.children[charToFind];
    }
    return currentNode!.isWordEnd;
  }

  bool startsWithPrefix(String prefix) {
    TrieNode? currentNode = root;
    for (int i = 0; i < prefix.length; i++) {
      String charToFind = prefix[i];
      if (!currentNode!.children.containsKey(charToFind)) {
        return false;
      }
      currentNode = currentNode.children[charToFind];
    }
    return true;
  }
}

// ===========Test Cases===========

void main() {
  Trie trie = Trie();

  trie.insert("athul");
  trie.insert("athulya");

  print(trie.contains("athul")); // Output: true
  print(trie.startsWithPrefix("ath")); // Output: true
}
