int secondHighest(String s) {
  String newNum = s.replaceAll(RegExp(r'[^0-9]'), '');
  List<int> num = [];
  for (int i = 0; i < newNum.length; i++) {
    num.add(int.parse(newNum[i]));
  }
  num.sort();
  int largest = -1;
  for (int i = 0; i < num.length - 1; i++) {
    if (num[i] < num[i + 1]) {
      largest = num[i + 1];
      break;
    }
  }
  return largest;
}

void main() {
  int result = secondHighest('abc1111');
  print(result);
}
