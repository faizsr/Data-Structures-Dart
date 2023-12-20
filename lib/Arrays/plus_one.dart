void main() {
  // var result =
   plusOne([1, 2, 9]);
  // print(result);
}

plusOne(List<int> digits) {
  for (int i = digits.length - 1; i >= 0; i--) {
    if (digits[i] < 9) {
      digits[i]++;
      print(digits);
    } else {
      digits[i] = 0;
    }
  }
  digits.insert(0, 1);
  print(digits);
}
