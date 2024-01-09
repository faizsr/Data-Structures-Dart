class HashTable {
  late List<dynamic> table;
  int size;

  HashTable(this.size) {
    table = List<dynamic>.filled(size, []);
  }

  int hash(String key) {
    int total = 0;
    for (int i = 0; i < key.length; i++) {
      total += key.codeUnitAt(i);
    }
    return total % size;
  }

  void set(String key, dynamic value) {
    final index = hash(key);
    final bucket = table[index];
    if (bucket.isEmpty) {
      table[index] = [
        [key, value]
      ];
    } else {
      final sameKeyItem = bucket.firstWhere(
        (item) => item[0] == key,
        orElse: () => [],
      );
      print('same key $sameKeyItem');
      if (sameKeyItem.isNotEmpty) {
        sameKeyItem[1] = value;
      } else {
        bucket.add([key, value]);
      }
    }
  }

  dynamic get(String key) {
    final index = hash(key);
    final bucket = table[index];
    if (bucket.isNotEmpty) {
      final sameKeyItem = bucket.firstWhere(
        (item) => item[0] == key,
        orElse: () => [],
      );
      // print('same key $sameKeyItem');

      if (sameKeyItem.isNotEmpty) {
        return sameKeyItem[1];
      }
    }
    return null;
  }

  void remove(String key) {
    final index = hash(key);
    final bucket = table[index];
    if (bucket.isNotEmpty) {
      final sameKeyItem = bucket.firstWhere(
        (item) => item[0] == key,
        orElse: () => [],
      );
      if (sameKeyItem.isNotEmpty) {
        bucket.remove(sameKeyItem);
      }
    }
  }

  void display() {
    for (int i = 0; i < table.length; i++) {
      if (table[i].isNotEmpty) {
        print('$i: ${table[i]}');
      }
    }
  }
}

void main() {
  HashTable table = HashTable(50);
  table.set("name", "User 1");
  table.set("mane", "User 2");
  table.set("name", "user 4");
  table.set("age", 10);
  print(table.get("age"));
  table.remove('name');
  table.display();
  // ht.remove("mane");
  // ht.display();
}
