class HashNode {
  late String key;
  late dynamic value;
  HashNode? next;

  HashNode(this.key, this.value);
}

class HashTable {
  List<HashNode>? bucketArray;
  late int size;

  HashTable(this.size) {
    bucketArray = List<HashNode>.filled(size, HashNode('', '' as dynamic));
  }

  int hash(String key) {
    int index = 0;
    for (int i = 0; i < key.length; i++) {
      index += key.codeUnitAt(i);
    }
    return index % size;
  }

  dynamic get(String key) {
    int index = hash(key);
    HashNode? temp = bucketArray![index];
    while (temp != null) {
      if (temp.key == key) {
        return temp.value;
      }
      temp = temp.next;
    }
    return 'Value not found';
  }

  void set(String key, dynamic value) {
    int index = hash(key);
    HashNode? temp = bucketArray![index];
    while (temp != null) {
      if (temp.key == key) {
        temp.value = value;
        return;
      }
      temp = temp.next;
    }
    HashNode? newNode = HashNode(key, value);
    newNode.next = bucketArray![index];
    bucketArray![index] = newNode;
  }

  void remove(String key) {
    int index = hash(key);
    HashNode? temp = bucketArray![index];
    if (temp.key == key) {
      bucketArray![index] = temp.next!;
      return;
    }
    while (temp!.next != null) {
      if (temp.next!.key == key) {
        temp.next = temp.next!.next;
      }
      temp = temp.next;
    }
  }

  display() {
    for (var value in bucketArray!) {
      HashNode? current = value;
      while (current != null) {
        print('${current.key}: ${current.value} ');
        current = current.next;
      }
    }
  }
}

void main() {
  HashTable table = HashTable(11);
  table.set('AB', 'Joyal');
  table.set('BA', 'Jo');
  table.set('81', 'siiii');
  // table.remove('7');
  print(table.get('AB'));
  print(table.get('BA'));
  // table.remove('AB');
  print(table.get('AB'));
  table.display();
}
