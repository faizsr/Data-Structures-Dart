int secondHighest(String s) {
  String newNum = s.replaceAll(RegExp(r'[^0-9]'), '');
  Set<int> num = {};
  for (int i = 0; i < newNum.length; i++) {
    num.add(int.parse(newNum[i]));
  }
  List<int> numsList = num.toList();
  numsList.sort();
  return numsList.length <= 1 ? -1 : numsList[numsList.length - 2];
}

void main() {
  int result = secondHighest('abc114361');
  print(result);
}
