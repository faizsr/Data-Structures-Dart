void main() {
  String result = maxProductDifference("hai", 3);
  print(result);
}

String maxProductDifference(String str, int key) {
  int value = key % 26;
  List<String> charArray = [];
  for (int i = 0; i < str.length; i++) {
    int ascii = str.codeUnitAt(i) + value;

    if (ascii <= 122) {
      charArray.add(String.fromCharCode(ascii));
    } else {
      ascii = (ascii - 122) + 96;
      charArray.add(String.fromCharCode(ascii));
    }
  }
  str = charArray.join();
  return str;
}
