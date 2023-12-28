class HashNode<k, v> {
  late k key;
  late v value;
  HashNode<k, v>? next;

  HashNode(this.key, this.value);
}

class HashTable<k, v> {
  List<HashNode<k, v>>? bucketArray;
  late int size;

  HashTable(this.size) {
    bucketArray = List<HashNode<k, v>>.filled(size, HashNode([] as k, [] as v));
  }

  int hash(k key) {
    int index = key.hashCode;
    return index % size;
  }

  v? get(k key) {
    int index = hash(key);
    HashNode<k, v>? temp = bucketArray![index];
    while (temp != null) {
      if (temp.key == key) {
        return temp.value;
      }
      temp = temp.next;
    }
    return null;
  }

  void set(k key, v value) {
    int index = hash(key);
    HashNode<k, v>? temp = bucketArray![index];
    while (temp != null) {
      if (temp.key == key) {
        temp.value = value;
        return;
      }
      temp = temp.next;
    }
    temp = bucketArray![index];
    HashNode<k, v> newNode = HashNode(key, value);
    newNode.next = temp;
    bucketArray![index] = newNode;
  }

  void remove(k key) {
    int index = hash(key);
    HashNode<k, v>? temp = bucketArray![index];
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
}

void main() {
  HashTable table = HashTable(11);
  table.set(7, 'Joyal');
  table.set(18, 'Jo');
  // table.remove(7);
  print(table.get(7));
  print(table.get(18));
}
