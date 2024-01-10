void main() {
  String result = duplicateStringCount('AAABBC');
  print(result);
}

String duplicateStringCount(String str) {
  int count = 1;
  String newString = "";
  for (int i = 1; i < str.length; i++) {
    if (str.codeUnitAt(i) == str.codeUnitAt(i - 1)) {
      count++;
    } else {
      newString = newString + count.toString() + str[i - 1];
      count = 1;
    }
  }
  newString = newString + count.toString() + str[str.length - 1];
  return newString;
}
