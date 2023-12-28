class HashTable {
  List<dynamic>? table;
  int size;

  HashTable(this.size) {
    table = List<dynamic>.filled(size, null, growable: true);
  }

  hash(String key) {
    int total = 0;
    for (int i = 0; i < key.length; i++) {
      total += key.codeUnitAt(i);
    }
    return total % size;
  }

  set(String key, dynamic value) {
    int index = hash(key);
    table![index] = value;
  }

  get(String key) {
    int index = hash(key);
    return table![index] ?? 'No value found!!';
  }

  remove(String key) {
    int index = hash(key);
    table![index] = null;
  }

  display() {
    for (int i = 0; i < table!.length; i++) {
      if (table![i] != null) {
        print('$i, ${table![i]} \t');
      }
    }
  }
}

void main() {
  HashTable table = HashTable(50);

  table.set('name', 'bruce');
  table.set('age', 25);
  table.display();
  print(table.get('name'));
  table.remove('mane');
  print(table.get('name'));
  table.display();
}
